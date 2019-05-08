import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557313039761&di=143f740f6efaef860d8f1b395d52d782&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fe407323ec618f4099bfd05e5367f5518e94596db4d5e5-iTEXmJ_fw658'),
      ),
    );
  }
}
