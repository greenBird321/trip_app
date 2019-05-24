import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// 自定义webView
class webView extends StatefulWidget {
  final String title;         // 自定义viewView中 需要fullter布局 title
  final String url;           // 自定义viewView中 需要给webView一个url
  final String statusBarColor;  // 自定义viewView中 状态栏颜色
  final bool hideAppBar;      // 自定义viewView中 是否隐藏appBar
  final bool backForbid;     // 自定义viewView中 返回上一页按钮

  webView({this.title, this.url, this.statusBarColor, this.hideAppBar, this.backForbid});

  @override
  _webViewState createState() => _webViewState();

}

class _webViewState extends State<webView> {
  // 实例化 webView插件
  final webViewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    // 此处 是为了防止页面打开多次，才会在init的时候进行
    webViewPlugin.close();
    // 监听页面url的改变
    webViewPlugin.onUrlChanged.listen((String url) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}