
class MovieDetailsModel {
  String? status;
  String? statusMessage;
  Data? data;

  MovieDetailsModel({this.status, this.statusMessage, this.data});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusMessage = json["status_message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<MovieDetailsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MovieDetailsModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["status_message"] = statusMessage;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}


class Data {
  MovieDetails? movieDetails;

  Data({this.movieDetails});

  Data.fromJson(Map<String, dynamic> json) {
    movieDetails = json["movie"] == null ? null : MovieDetails.fromJson(json["movie"]);
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(movieDetails != null) {
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
  double? rating;
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

  MovieDetails({this.id, this.url, this.imdbCode, this.title, this.titleEnglish, this.titleLong, this.slug, this.year, this.rating, this.runtime, this.genres, this.likeCount, this.descriptionIntro, this.descriptionFull, this.ytTrailerCode, this.language, this.mpaRating, this.backgroundImage, this.backgroundImageOriginal, this.smallCoverImage, this.mediumCoverImage, this.largeCoverImage, this.mediumScreenshotImage1, this.mediumScreenshotImage2, this.mediumScreenshotImage3, this.largeScreenshotImage1, this.largeScreenshotImage2, this.largeScreenshotImage3, this.cast, this.torrents, this.dateUploaded, this.dateUploadedUnix});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    url = json["url"];
    imdbCode = json["imdb_code"];
    title = json["title"];
    titleEnglish = json["title_english"];
    titleLong = json["title_long"];
    slug = json["slug"];
    year = json["year"];
    rating = json["rating"];
    runtime = json["runtime"];
    genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
    likeCount = json["like_count"];
    descriptionIntro = json["description_intro"];
    descriptionFull = json["description_full"];
    ytTrailerCode = json["yt_trailer_code"];
    language = json["language"];
    mpaRating = json["mpa_rating"];
    backgroundImage = json["background_image"];
    backgroundImageOriginal = json["background_image_original"];
    smallCoverImage = json["small_cover_image"];
    mediumCoverImage = json["medium_cover_image"];
    largeCoverImage = json["large_cover_image"];
    mediumScreenshotImage1 = json["medium_screenshot_image1"];
    mediumScreenshotImage2 = json["medium_screenshot_image2"];
    mediumScreenshotImage3 = json["medium_screenshot_image3"];
    largeScreenshotImage1 = json["large_screenshot_image1"];
    largeScreenshotImage2 = json["large_screenshot_image2"];
    largeScreenshotImage3 = json["large_screenshot_image3"];
    cast = json["cast"] == null ? null : (json["cast"] as List).map((e) => Cast.fromJson(e)).toList();
    torrents = json["torrents"] == null ? null : (json["torrents"] as List).map((e) => Torrents.fromJson(e)).toList();
    dateUploaded = json["date_uploaded"];
    dateUploadedUnix = json["date_uploaded_unix"];
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
    if(genres != null) {
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
    if(cast != null) {
      _data["cast"] = cast?.map((e) => e.toJson()).toList();
    }
    if(torrents != null) {
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

  Torrents({this.url, this.hash, this.quality, this.type, this.isRepack, this.videoCodec, this.bitDepth, this.audioChannels, this.seeds, this.peers, this.size, this.sizeBytes, this.dateUploaded, this.dateUploadedUnix});

  Torrents.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    hash = json["hash"];
    quality = json["quality"];
    type = json["type"];
    isRepack = json["is_repack"];
    videoCodec = json["video_codec"];
    bitDepth = json["bit_depth"];
    audioChannels = json["audio_channels"];
    seeds = json["seeds"];
    peers = json["peers"];
    size = json["size"];
    sizeBytes = json["size_bytes"];
    dateUploaded = json["date_uploaded"];
    dateUploadedUnix = json["date_uploaded_unix"];
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
  String? urlSmallImage;
  String? imdbCode;

  Cast({this.name, this.characterName, this.urlSmallImage, this.imdbCode});

  Cast.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    characterName = json["character_name"];
    urlSmallImage = json["url_small_image"];
    imdbCode = json["imdb_code"];
  }

  static List<Cast> fromList(List<Map<String, dynamic>> list) {
    return list.map(Cast.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["character_name"] = characterName;
    _data["url_small_image"] = urlSmallImage;
    _data["imdb_code"] = imdbCode;
    return _data;
  }
}