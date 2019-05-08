import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557313005536&di=83a18f786c325684c484d32fdb3da5ab&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F8c18cbfe1ae95fab236ec624ecca4b276434d3dd1820b-MoASmD_fw658'),
      ),
    );
  }
}
