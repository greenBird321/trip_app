import 'package:flutter/material.dart';
import 'package:trip_app/model/gridNav_model.dart';

// @immutable 注解，表示此类以及继承此类的子类，都是不可变的, 这也就是组件的属性为什么都用final修饰的原因
class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;
  // 数据通过 初始化方法传递
  const GridNav({Key key, @required this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return null;
  }

}