import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// 等待动画
const LOAD_IMAGE_URL =
    'http://hbimg.b0.upaiyun.com/ecb84e509ddf8806b44abf6db20fa46e7017fb4414c87-jWQlIM_fw658';
// 携程白名单,禁止访问
const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

// 自定义webView
class webView extends StatefulWidget {
  final String title; // 自定义viewView中 需要fullter布局 title
  final String url; // 自定义viewView中 需要给webView一个url
  final String statusBarColor; // 自定义viewView中 状态栏颜色
  final bool hideAppBar; // 自定义viewView中 是否隐藏appBar
  final bool backForbid; // 自定义viewView中 是否禁止返回规定的url

  webView(
      {this.title,
      this.url,
      this.statusBarColor,
      this.hideAppBar,
      this.backForbid = false});

  @override
  _webViewState createState() => _webViewState();
}

class _webViewState extends State<webView> {
  // 实例化 webView插件
  final webViewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  // 此标记位代表是否已经回到了Flutter
  bool exiting = false;

  @override
  void initState() {
    super.initState();
    // 此处 是为了防止页面打开多次，才会在init的时候进行
    webViewPlugin.close();
    // 监听浏览器url的变化 cancel
    _onUrlChanged = webViewPlugin.onUrlChanged.listen((String url) {});

    // 当页面改变状态的时候触发，切换页面也算是改变状态
    _onStateChanged =
        webViewPlugin.onStateChanged.listen((WebViewStateChanged stateChanged) {
//      case 'shouldStart':
//      t = WebViewState.shouldStart;
//      break;
//      case 'startLoad':
//      t = WebViewState.startLoad;
//      break;
//      case 'finishLoad':
//      t = WebViewState.finishLoad;
//      break;
//      case 'abortLoad':
//      t = WebViewState.abortLoad;
//      break;
      switch (stateChanged.type) {
        case WebViewState.startLoad:
          // TODO SOMETHING 禁止浏览器跳转到携程首页
          if (_isToMain(stateChanged.url) && !exiting) {
            if (widget.backForbid) {
              // 是否禁止返回规定的url
              webViewPlugin.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });

    // 监听webView错误 404 页面找不到的描述
    _onHttpError = webViewPlugin.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  // 禁止访问白名单中的url
  _isToMain(String url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      // ?.操作符 如果左边表达式为空 则不会进行右边的计算，如果不为空才会进入右边的计算
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  Widget build(BuildContext context) {
    // 默认的statusBar颜色, 字符串的颜色如何转化成int类型， 字符串的颜色改成 int 类型颜色, 需要补全位数，字符串一般是6位，数字类型一般是10位，补全 0xff, ff代表alpha值。
    String statusBarColor = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statusBarColor == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(int.parse('0xff' + statusBarColor)), backButtonColor),
          // 自定义appBar 不使用系统的appBar
          // webView占满除去_appBar占据的所有空间，Expanded 展开widget
          Expanded(
              child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            // 是否缩放
            withLocalStorage: true,
            // 时候开启本地存储
            hidden: true,
            //TODO 主要，这个是在加载url时候，需要展示的加载图,flutter_webview_plugin有BUG，设置无效
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: Image.network(LOAD_IMAGE_URL),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _appBar(Color backgroundColor, Color backButtonColor) {
    // 默认没有自定义appBar
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: 30.0,
      );
    }

    return Container(
      // FractionallySizedBox撑满屏幕的高度或者宽度
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
              onTap: () => Navigator.of(context).pop(context),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backButtonColor, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 销毁webViewPlugin
    webViewPlugin.dispose();
    // 取消监听url改变事件的处理
    _onUrlChanged.cancel();
    // 取消监听StateBar改变事件的处理
    _onStateChanged.cancel();
    // 取消监听httpError
    _onHttpError.cancel();
  }
}
