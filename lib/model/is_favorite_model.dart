
class IsFavoriteModel {
  String? message;
  bool? data;

  IsFavoriteModel({this.message, this.data});

  IsFavoriteModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is bool) {
      data = json["data"];
    }
  }

  static List<IsFavoriteModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(IsFavoriteModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["data"] = data;
    return _data;
  }
}