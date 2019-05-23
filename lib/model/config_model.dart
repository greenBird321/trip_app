class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }

  // 将class转换成Map
  Map<String, dynamic> toJson() {
    return {
      "searchUrl": this.searchUrl,
    };
  }
}