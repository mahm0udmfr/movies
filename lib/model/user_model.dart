
class UserModel {
  String? message;
  UserData? userdata;

  UserModel({this.message, this.userdata});

  UserModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is Map) {
      userdata = json["data"] == null ? null : UserData.fromJson(json["data"]);
    }
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if(userdata != null) {
      _data["data"] = userdata?.toJson();
    }
    return _data;
  }
}

class UserData {
  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;

  UserData({this.id, this.email, this.password, this.name, this.phone, this.avaterId, this.createdAt, this.updatedAt, this.v});

  UserData.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["avaterId"] is int) {
      avaterId = json["avaterId"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  static List<UserData> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["email"] = email;
    _data["password"] = password;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["avaterId"] = avaterId;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}