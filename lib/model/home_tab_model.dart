class HomeTabModel {
  final String status;
  final String statusMessage;
  final MoviesData data;

  HomeTabModel({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory HomeTabModel.fromJson(Map<String, dynamic> json) => HomeTabModel(
        status: json["status"],
        statusMessage: json["status_message"],
        data: MoviesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_message": statusMessage,
        "data": data.toJson(),
      };
}

class MoviesData {
  final int movieCount;
  final int limit;
  final int pageNumber;
  final List<Movie> movies;

  MoviesData({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory MoviesData.fromJson(Map<String, dynamic> json) => MoviesData(
        movieCount: json["movie_count"],
        limit: json["limit"],
        pageNumber: json["page_number"],
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movie_count": movieCount,
        "limit": limit,
        "page_number": pageNumber,
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
      };
}

class Movie {
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String summary;
  final String descriptionFull;
  final String synopsis;
  final String ytTrailerCode;
  final String language;
  final String mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final String state;
  final List<Torrent> torrents;
  final String dateUploaded;
  final int dateUploadedUnix;

  Movie({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.state,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        url: json["url"],
        imdbCode: json["imdb_code"],
        title: json["title"],
        titleEnglish: json["title_english"],
        titleLong: json["title_long"],
        slug: json["slug"],
        year: json["year"],
        rating: json["rating"].toDouble(),
        runtime: json["runtime"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        summary: json["summary"],
        descriptionFull: json["description_full"],
        synopsis: json["synopsis"],
        ytTrailerCode: json["yt_trailer_code"],
        language: json["language"],
        mpaRating: json["mpa_rating"],
        backgroundImage: json["background_image"],
        backgroundImageOriginal: json["background_image_original"],
        smallCoverImage: json["small_cover_image"],
        mediumCoverImage: json["medium_cover_image"],
        largeCoverImage: json["large_cover_image"],
        state: json["state"],
        torrents: List<Torrent>.from(json["torrents"].map((x) => Torrent.fromJson(x))),
        dateUploaded: json["date_uploaded"],
        dateUploadedUnix: json["date_uploaded_unix"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "imdb_code": imdbCode,
        "title": title,
        "title_english": titleEnglish,
        "title_long": titleLong,
        "slug": slug,
        "year": year,
        "rating": rating,
        "runtime": runtime,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "summary": summary,
        "description_full": descriptionFull,
        "synopsis": synopsis,
        "yt_trailer_code": ytTrailerCode,
        "language": language,
        "mpa_rating": mpaRating,
        "background_image": backgroundImage,
        "background_image_original": backgroundImageOriginal,
        "small_cover_image": smallCoverImage,
        "medium_cover_image": mediumCoverImage,
        "large_cover_image": largeCoverImage,
        "state": state,
        "torrents": List<dynamic>.from(torrents.map((x) => x.toJson())),
        "date_uploaded": dateUploaded,
        "date_uploaded_unix": dateUploadedUnix,
      };
}

class Torrent {
  final String url;
  final String hash;
  final String quality;
  final String type;
  final String isRepack;
  final String videoCodec;
  final String bitDepth;
  final String audioChannels;
  final int seeds;
  final int peers;
  final String size;
  final int sizeBytes;
  final String dateUploaded;
  final int dateUploadedUnix;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) => Torrent(
        url: json["url"],
        hash: json["hash"],
        quality: json["quality"],
        type: json["type"],
        isRepack: json["is_repack"],
        videoCodec: json["video_codec"],
        bitDepth: json["bit_depth"],
        audioChannels: json["audio_channels"],
        seeds: json["seeds"],
        peers: json["peers"],
        size: json["size"],
        sizeBytes: json["size_bytes"],
        dateUploaded: json["date_uploaded"],
        dateUploadedUnix: json["date_uploaded_unix"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "hash": hash,
        "quality": quality,
        "type": type,
        "is_repack": isRepack,
        "video_codec": videoCodec,
        "bit_depth": bitDepth,
        "audio_channels": audioChannels,
        "seeds": seeds,
        "peers": peers,
        "size": size,
        "size_bytes": sizeBytes,
        "date_uploaded": dateUploaded,
        "date_uploaded_unix": dateUploadedUnix,
      };
}