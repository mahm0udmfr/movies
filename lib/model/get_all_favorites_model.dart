class GetAllFavorites {
  GetAllFavorites({this.message, this.data, this.error});

  GetAllFavorites.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataGetAllFavorites.fromJson(v));
      });
    }
  }

  String? message;
  String? error;
  List<DataGetAllFavorites>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataGetAllFavorites {
  DataGetAllFavorites({
    this.movieId,
    this.name,
    this.rating,
    this.imageURL,
    this.year,
  });

  DataGetAllFavorites.fromJson(dynamic json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = json['rating'];
    imageURL = json['imageURL'];
    year = json['year'];
  }

  String? movieId;
  String? name;
  num? rating;
  String? imageURL;
  String? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movieId'] = movieId;
    map['name'] = name;
    map['rating'] = rating;
    map['imageURL'] = imageURL;
    map['year'] = year;
    return map;
  }
}
