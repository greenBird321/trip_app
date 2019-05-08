import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557313074454&di=ae610ad05e238f9ab83cb12c63f15a3d&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn14%2F566%2Fw580h786%2F20180506%2Fb05f-hacuuvt9852463.jpg'),
      ),
    );
  }
}
