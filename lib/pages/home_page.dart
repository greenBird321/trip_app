import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557312879650&di=fe0f3fda0a456ac632fb5f744a29da1e&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F71781c2667244a2c018684636ad7cfa3073082652e6e4-Ln43kY_fw658'),
      ),
    );
  }
}
