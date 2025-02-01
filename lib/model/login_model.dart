
class LoginModel {
  String? message;
  String? data;
  String? error;
  int? statusCode;

  LoginModel({this.message, this.data, this.error, this.statusCode});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is String) {
      data = json["data"];
    }
    if(json["error"] is String) {
      error = json["error"];
    }
    if(json["statusCode"] is int) {
      statusCode = json["statusCode"];
    }
  }

  static List<LoginModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(LoginModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["data"] = data;
    data["error"] = error;
    data["statusCode"] = statusCode;
    return data;
  }
}