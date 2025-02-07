
class UpdateProfileModel {
  String? message;

  UpdateProfileModel({this.message});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  static List<UpdateProfileModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UpdateProfileModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    return _data;
  }
}