
class AddtofavoriteModel {
  String? message;
  Data? data;

  AddtofavoriteModel({this.message, this.data});

  AddtofavoriteModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<AddtofavoriteModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(AddtofavoriteModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? movieId;
  String? name;
  double? rating;
  String? imageUrl;
  String? year;

  Data({this.movieId, this.name, this.rating, this.imageUrl, this.year});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["movieId"] is String) {
      movieId = json["movieId"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["rating"] is double) {
      rating = json["rating"];
    }
    if(json["imageURL"] is String) {
      imageUrl = json["imageURL"];
    }
    if(json["year"] is String) {
      year = json["year"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["movieId"] = movieId;
    _data["name"] = name;
    _data["rating"] = rating;
    _data["imageURL"] = imageUrl;
    _data["year"] = year;
    return _data;
  }
}