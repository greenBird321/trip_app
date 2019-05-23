import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trip_app/dao/home_dao.dart';
import 'package:trip_app/model/home_model.dart';
import 'package:trip_app/tools/imageClipper.dart';
import 'dart:convert';
import 'dart:async';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  List _imgUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg',
  ];

  // 用于 D A O 层测试
  String resultString = '';

  _onScroller(double offset) {
    double _appAlpha = offset / APPBAR_SCROLL_OFFSET;
    if (_appAlpha < 0) {
      _appAlpha = 0;
    } else if (_appAlpha > 1) {
      _appAlpha = 1;
    }

    setState(() {
      appBarAlpha = _appAlpha;
    });
  }

  // 测试 D a o 方法
  loadData() async {
    // 方法1 类似 js的es6语法
//    HomeDao.fetch().then((result) {
//      setState(() {
//        resultString = json.encode(result);
//      });
//    }).catchError((e) {
//      setState(() {
//        resultString = e;
//      });
//    });

    // 方法2 flutter语法方式
//    try {
    HomeModel model = await HomeDao.fetch();
    setState(() {
      resultString = json.encode(model);
    });
//    } catch (e) {
//      setState(() {
//        resultString = e.toString();
//      });
//    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        // removePadding最主要的属性 removeTop, removeRight, romoveLeft 如不添加则不起作用
        context: context,
        child: NotificationListener(
            // 监听列表滚动需要添加的类 NotificationListener
            onNotification: (scrollNotification) {
              // 监听回调
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                // 为了程序效率的提升，如不判断在列表不滚动的时候也会调用此方法
                _onScroller(scrollNotification.metrics.pixels);
              }
            },
            child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipPath(
                          clipper: imageCliper(),
                          child: SizedBox(
                            height: 250,
                            child: Swiper(
                              itemCount: _imgUrls.length,
                              autoplay: true,
                              // 自动播放
                              itemBuilder: (BuildContext context, int index) {
                                return Image.network(
                                  _imgUrls[index],
                                  fit: BoxFit.fill,
                                );
                              },
                              pagination: new SwiperPagination(
                                alignment: Alignment(1.0, 0.5),
                              ),
                            ),
                          ),
                        ),
                        new Positioned(
                            left: 15.0,
                            right: 15.0,
                            top: 200,
                            height: 50,
                            child: Card(
                              elevation: 5.0,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Container(
                     // height: 200,
                      decoration: BoxDecoration(color: Colors.lightBlueAccent),
                      child: Text(resultString),
                    ),
                  ],
                ),
                Opacity(
                  opacity: appBarAlpha,
                  child: Container(
                    height: 80,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
