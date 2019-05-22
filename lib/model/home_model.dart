import 'package:trip_app/model/config_model.dart';
import 'package:trip_app/model/common_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;

  HomeModel({this.config, this.bannerList});
}