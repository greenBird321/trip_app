import 'package:flutter/material.dart';
import 'package:trip_app/pages/home_page.dart';
import 'package:trip_app/pages/search_page.dart';
import 'package:trip_app/pages/travel_page.dart';
import 'package:trip_app/pages/my_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

// 使用pageView作为BottomNavigation的Body
class _TabNavigatorState extends State<TabNavigator> {
  final Color _kDefaultColor = Colors.grey;
  final Color _kActiveColor = Colors.blue;
  int _currentIndex = 0;

  final PageController _controller = PageController(
    // Controller需要设置一个initialPage
    initialPage: 0, // 默认显示第0个页面
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
        onPageChanged: (pageIndex) {
          setState(() {
            // 当页面切换的时候，tabBarItem的状态也要随之切换
            _currentIndex = pageIndex;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // 设置tabBar的样式 BottomNavigationBarItem 下的label是否一直显示
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _kDefaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _kActiveColor,
            ),
            title: Text(
              '首页',
              style: TextStyle(
                  color: _currentIndex != 0 ? _kDefaultColor : _kActiveColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _kDefaultColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: _kActiveColor,
            ),
            title: Text(
              '搜索',
              style: TextStyle(
                  color: _currentIndex != 1 ? _kDefaultColor : _kActiveColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: _kDefaultColor,
            ),
            activeIcon: Icon(
              Icons.camera_alt,
              color: _kActiveColor,
            ),
            title: Text(
              '旅拍',
              style: TextStyle(
                  color: _currentIndex != 2 ? _kDefaultColor : _kActiveColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _kDefaultColor,
            ),
            activeIcon: Icon(
              Icons.account_circle,
              color: _kActiveColor,
            ),
            title: Text(
              '我的',
              style: TextStyle(
                  color: _currentIndex != 3 ? _kDefaultColor : _kActiveColor),
            ),
          ),
        ],
        onTap: (index) {
          _controller.jumpToPage(
              index); // 通过PageView进行跳转，因为PageView是通过PageViewController管理的
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
