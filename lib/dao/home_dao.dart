import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trip_app/model/home_model.dart';

const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';

// d a o 层主要是用于进行页面数据的网络请求以及解析，并传递给Model层 进行数据处理
class HomeDao {

  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_URL);
    // 检查请求是否成功
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // 解决 中文乱码问题
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {    // 网络状态码有问题直接抛出异常
      throw Exception('Failed to load home_page.json'); // dart抛出异常 写法
    }
  }
}
