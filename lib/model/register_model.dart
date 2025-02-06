class RegisterModel {
  String? message;
  Data? data;

  RegisterModel({this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<RegisterModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(RegisterModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data(
      {this.email,
      this.password,
      this.name,
      this.phone,
      this.avaterId,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["avaterId"] is int) {
      avaterId = json["avaterId"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["avaterId"] = avaterId;
    _data["_id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}
