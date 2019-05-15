import 'package:flutter/material.dart';

/// 自定义的曲线裁剪组件
///
class imageCliper extends CustomClipper<Path> {
  // 得到剪辑('getClip')抽象方法, 给定被剪辑的渲染对象具有给定大小的剪辑描述
  @override
  Path getClip(Size size) {
    // TODO: 自定义的主要操作内容
    var path = Path();
    // 使用二次贝塞尔曲线
    // 起点变量。
    path.lineTo(0.0, size.height - 25.0);
    // 偏移（`Offset`）类，不可变的2D浮点偏移量。
    // 第一个控制点和第一点变量。
    var firstControlPoint = Offset(size.width / 4, size.height - 10.0);
    var firstPoint = Offset(size.width / 2, size.height - 5 );
    // 二次贝塞尔曲线（`quadraticBezierTo`）方法，
    // 使用控制点（x1，y1）添加从当前点到给定点（x2，y2）的二次贝塞尔曲线段。
    // 第一个中间曲线变量。
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);
    // 第二个控制点和第二点变量。
    var secondControlPoint =
    Offset(size.width - (size.width / 4), size.height - 10.0);
    // 第二个中间曲线变量。
    var secondPoint = Offset(size.width, size.height - 25.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);
    // 终点变量。
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}