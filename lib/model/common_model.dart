// 由于返回值都是那几个字段，可以把他们提取到一个model中，不需要一个数据结构写一个model
class CommonModel {
  final String icon;
  final String url;
  final String title;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.url, this.title, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json['icon'],
        url: json['url'],
        title: json['title'],
        statusBarColor: json['statusBarColor'],
        hideAppBar: json['hideAppBar']);
  }
}
