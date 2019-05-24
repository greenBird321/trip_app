import 'package:flutter/material.dart';
import 'package:trip_app/model/common_model.dart';

// @immutable 注解，表示此类以及继承此类的子类，都是不可变的, 这也就是组件的属性为什么都用final修饰的原因
class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavModel;

  // 数据通过 初始化方法传递
  const LocalNav({Key key, @required this.localNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)), // 设置圆角
      ),
      child: _items(), // 处理显示逻辑 不能在ui上直接处理，需要新建立方法处理 循环问题
    );
  }

  _items() {
    if (localNavModel == null) {
      return null;
    }
    List<Widget> localnavs = []; // 保存处理好的数据以及ui样式的LocalNav数组
    localNavModel.map((nav) {
      localnavs.add(_buildItem(nav));
    }).toList();
    return Row(
      // 因为每一个localNav元素是成一列布局，所以需要用Row()包裹一下
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 让每个localNav元素平均排列
      children: localnavs,
    );
  }

  // 每个localNavItem应该如何显示
  Widget _buildItem(CommonModel localNavModel) {
    return GestureDetector(
        onTap: () {
          print('点击了${localNavModel.title}');
        },
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            // 处理每个localNav元素布局,上下布局
            children: <Widget>[
              Image.network(
                localNavModel.icon,
                height: 32,
                width: 32,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  localNavModel.title,
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ));
  }
}
