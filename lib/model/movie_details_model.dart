class MovieDetailsModel {
  String? status;
  String? statusMessage;
  Data? data;

  MovieDetailsModel({this.status, this.statusMessage, this.data});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["status_message"] is String) {
      statusMessage = json["status_message"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<MovieDetailsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MovieDetailsModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["status_message"] = statusMessage;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  MovieDetails? movieDetails;

  Data({this.movieDetails});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["movie"] is Map) {
      movieDetails =
          json["movie"] == null ? null : MovieDetails.fromJson(json["movie"]);
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (movieDetails != null) {
      _data["movie"] = movieDetails?.toJson();
    }
    return _data;
  }
}

class MovieDetails {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  int? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<Cast>? cast;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  MovieDetails(
      {this.id,
      this.url,
      this.imdbCode,
      this.title,
      this.titleEnglish,
      this.titleLong,
      this.slug,
      this.year,
      this.rating,
      this.runtime,
      this.genres,
      this.likeCount,
      this.descriptionIntro,
      this.descriptionFull,
      this.ytTrailerCode,
      this.language,
      this.mpaRating,
      this.backgroundImage,
      this.backgroundImageOriginal,
      this.smallCoverImage,
      this.mediumCoverImage,
      this.largeCoverImage,
      this.mediumScreenshotImage1,
      this.mediumScreenshotImage2,
      this.mediumScreenshotImage3,
      this.largeScreenshotImage1,
      this.largeScreenshotImage2,
      this.largeScreenshotImage3,
      this.cast,
      this.torrents,
      this.dateUploaded,
      this.dateUploadedUnix});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["imdb_code"] is String) {
      imdbCode = json["imdb_code"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["title_english"] is String) {
      titleEnglish = json["title_english"];
    }
    if (json["title_long"] is String) {
      titleLong = json["title_long"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["year"] is int) {
      year = json["year"];
    }
    if (json["rating"] is int) {
      rating = json["rating"];
    }
    if (json["runtime"] is int) {
      runtime = json["runtime"];
    }
    if (json["genres"] is List) {
      genres =
          json["genres"] == null ? null : List<String>.from(json["genres"]);
    }
    if (json["like_count"] is int) {
      likeCount = json["like_count"];
    }
    if (json["description_intro"] is String) {
      descriptionIntro = json["description_intro"];
    }
    if (json["description_full"] is String) {
      descriptionFull = json["description_full"];
    }
    if (json["yt_trailer_code"] is String) {
      ytTrailerCode = json["yt_trailer_code"];
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["mpa_rating"] is String) {
      mpaRating = json["mpa_rating"];
    }
    if (json["background_image"] is String) {
      backgroundImage = json["background_image"];
    }
    if (json["background_image_original"] is String) {
      backgroundImageOriginal = json["background_image_original"];
    }
    if (json["small_cover_image"] is String) {
      smallCoverImage = json["small_cover_image"];
    }
    if (json["medium_cover_image"] is String) {
      mediumCoverImage = json["medium_cover_image"];
    }
    if (json["large_cover_image"] is String) {
      largeCoverImage = json["large_cover_image"];
    }
    if (json["medium_screenshot_image1"] is String) {
      mediumScreenshotImage1 = json["medium_screenshot_image1"];
    }
    if (json["medium_screenshot_image2"] is String) {
      mediumScreenshotImage2 = json["medium_screenshot_image2"];
    }
    if (json["medium_screenshot_image3"] is String) {
      mediumScreenshotImage3 = json["medium_screenshot_image3"];
    }
    if (json["large_screenshot_image1"] is String) {
      largeScreenshotImage1 = json["large_screenshot_image1"];
    }
    if (json["large_screenshot_image2"] is String) {
      largeScreenshotImage2 = json["large_screenshot_image2"];
    }
    if (json["large_screenshot_image3"] is String) {
      largeScreenshotImage3 = json["large_screenshot_image3"];
    }
    if (json["cast"] is List) {
      cast = json["cast"] == null
          ? null
          : (json["cast"] as List).map((e) => Cast.fromJson(e)).toList();
    }
    if (json["torrents"] is List) {
      torrents = json["torrents"] == null
          ? null
          : (json["torrents"] as List)
              .map((e) => Torrents.fromJson(e))
              .toList();
    }
    if (json["date_uploaded"] is String) {
      dateUploaded = json["date_uploaded"];
    }
    if (json["date_uploaded_unix"] is int) {
      dateUploadedUnix = json["date_uploaded_unix"];
    }
  }

  static List<MovieDetails> fromList(List<Map<String, dynamic>> list) {
    return list.map(MovieDetails.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["url"] = url;
    _data["imdb_code"] = imdbCode;
    _data["title"] = title;
    _data["title_english"] = titleEnglish;
    _data["title_long"] = titleLong;
    _data["slug"] = slug;
    _data["year"] = year;
    _data["rating"] = rating;
    _data["runtime"] = runtime;
    if (genres != null) {
      _data["genres"] = genres;
    }
    _data["like_count"] = likeCount;
    _data["description_intro"] = descriptionIntro;
    _data["description_full"] = descriptionFull;
    _data["yt_trailer_code"] = ytTrailerCode;
    _data["language"] = language;
    _data["mpa_rating"] = mpaRating;
    _data["background_image"] = backgroundImage;
    _data["background_image_original"] = backgroundImageOriginal;
    _data["small_cover_image"] = smallCoverImage;
    _data["medium_cover_image"] = mediumCoverImage;
    _data["large_cover_image"] = largeCoverImage;
    _data["medium_screenshot_image1"] = mediumScreenshotImage1;
    _data["medium_screenshot_image2"] = mediumScreenshotImage2;
    _data["medium_screenshot_image3"] = mediumScreenshotImage3;
    _data["large_screenshot_image1"] = largeScreenshotImage1;
    _data["large_screenshot_image2"] = largeScreenshotImage2;
    _data["large_screenshot_image3"] = largeScreenshotImage3;
    if (cast != null) {
      _data["cast"] = cast?.map((e) => e.toJson()).toList();
    }
    if (torrents != null) {
      _data["torrents"] = torrents?.map((e) => e.toJson()).toList();
    }
    _data["date_uploaded"] = dateUploaded;
    _data["date_uploaded_unix"] = dateUploadedUnix;
    return _data;
  }
}

class Torrents {
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Torrents(
      {this.url,
      this.hash,
      this.quality,
      this.type,
      this.isRepack,
      this.videoCodec,
      this.bitDepth,
      this.audioChannels,
      this.seeds,
      this.peers,
      this.size,
      this.sizeBytes,
      this.dateUploaded,
      this.dateUploadedUnix});

  Torrents.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["hash"] is String) {
      hash = json["hash"];
    }
    if (json["quality"] is String) {
      quality = json["quality"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["is_repack"] is String) {
      isRepack = json["is_repack"];
    }
    if (json["video_codec"] is String) {
      videoCodec = json["video_codec"];
    }
    if (json["bit_depth"] is String) {
      bitDepth = json["bit_depth"];
    }
    if (json["audio_channels"] is String) {
      audioChannels = json["audio_channels"];
    }
    if (json["seeds"] is int) {
      seeds = json["seeds"];
    }
    if (json["peers"] is int) {
      peers = json["peers"];
    }
    if (json["size"] is String) {
      size = json["size"];
    }
    if (json["size_bytes"] is int) {
      sizeBytes = json["size_bytes"];
    }
    if (json["date_uploaded"] is String) {
      dateUploaded = json["date_uploaded"];
    }
    if (json["date_uploaded_unix"] is int) {
      dateUploadedUnix = json["date_uploaded_unix"];
    }
  }

  static List<Torrents> fromList(List<Map<String, dynamic>> list) {
    return list.map(Torrents.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["hash"] = hash;
    _data["quality"] = quality;
    _data["type"] = type;
    _data["is_repack"] = isRepack;
    _data["video_codec"] = videoCodec;
    _data["bit_depth"] = bitDepth;
    _data["audio_channels"] = audioChannels;
    _data["seeds"] = seeds;
    _data["peers"] = peers;
    _data["size"] = size;
    _data["size_bytes"] = sizeBytes;
    _data["date_uploaded"] = dateUploaded;
    _data["date_uploaded_unix"] = dateUploadedUnix;
    return _data;
  }
}

class Cast {
  String? name;
  String? characterName;
  String? imdbCode;
  String? urlSmallImage;

  Cast({this.name, this.characterName, this.imdbCode, this.urlSmallImage});

  Cast.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["character_name"] is String) {
      characterName = json["character_name"];
    }
    if (json["imdb_code"] is String) {
      imdbCode = json["imdb_code"];
    }
    if (json["url_small_image"] is String) {
      urlSmallImage = json["url_small_image"];
    }
  }

  static List<Cast> fromList(List<Map<String, dynamic>> list) {
    return list.map(Cast.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["character_name"] = characterName;
    _data["imdb_code"] = imdbCode;
    _data["url_small_image"] = urlSmallImage;
    return _data;
  }
}
