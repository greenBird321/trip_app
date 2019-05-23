import 'package:trip_app/model/config_model.dart';
import 'package:trip_app/model/common_model.dart';
import 'package:trip_app/model/gridNav_model.dart';
import 'package:trip_app/model/salesBox_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final GridNavModel gridNav;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  // 需要注意: 主Model中的构造函数与其他Model不一致
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    // as 是 dart中的关键字，as 运算符: 用于检查类型， 如果json['localNavList']为空或者不是List类型，则会抛出异常
    var localNavListJson = json['localNavList'] as List;
    // 把数组中的所有元素都转化成CommonModel类型
    List<CommonModel> localNavList = localNavListJson
        .map((localNav) => CommonModel.fromJson(localNav))
        .toList();

    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList =
        bannerListJson.map((banner) => CommonModel.fromJson(banner)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList =
        subNavListJson.map((subNav) => CommonModel.fromJson(subNav)).toList();

    return HomeModel(
      config: ConfigModel.fromJson(json['config']),
      bannerList: bannerList,
      localNavList: localNavList,
      gridNav: GridNavModel.fromJson(json['gridNav']),
      subNavList: subNavList,
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "config": this.config,
      "bannerList": this.bannerList,
      "localNavList": this.localNavList,
      "gridNav": this.gridNav,
      "subNavList": this.subNavList,
      "salesBox": this.salesBox,
    };
  }
}
