import 'package:trip_app/model/common_model.dart';

class GridNavModel {
  final GridNavItem hotel;
  final GridNavItem flight;
  final GridNavItem travel;

  GridNavModel({this.hotel, this.flight, this.travel});

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return json != null // 容错处理，如果数据为空则返回空
        ? GridNavModel(
            hotel: GridNavItem.fromJson(json['hotel']),
            flight: GridNavItem.fromJson(json['flight']),
            travel: GridNavItem.fromJson(json['travel']))
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "hotel": this.hotel,
      "flight": this.flight,
      "travel": this.travel,
    };
  }
}

// 在处理数据的时候，如果数据结构之前就有定义则可以进行Model复用
class GridNavItem {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(
      startColor: json['startColor'],
      endColor: json['endColor'],
      // 如果模型中包含另一个模型，需要调用model的解析方法
      mainItem: CommonModel.fromJson(json['mainItem']),
      item1: CommonModel.fromJson(json['item1']),
      item2: CommonModel.fromJson(json['item2']),
      item3: CommonModel.fromJson(json['item3']),
      item4: CommonModel.fromJson(json['item4']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "startColor": this.startColor,
      "endColor": this.endColor,
      "mainItem": this.mainItem,
      "item1": this.item1,
      "item2": this.item2,
      "item3": this.item3,
      "item4": this.item4,
    };
  }
}
