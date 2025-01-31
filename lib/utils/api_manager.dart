import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/model/home_tab_model.dart';
import 'package:movies/utils/api_constant.dart';
import 'package:movies/utils/end_points.dart';

class ApiManager {
  static Future<HomeTabModel?> getMovies() async {
    Uri url = Uri.https(
      ApiConstant.moviesBaseUrl,
      EndPoints.listMovies,
    );
    try {
      var response = await http.get(url);
      return HomeTabModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      // ignore: use_rethrow_when_possible
      return null;
    }
  }

// https://newsapi.org/v2/everything?q=bitcoin&apiKey=84c34fd58ebe4efb98b64134a005e514

  // static Future<NewsModel?> getNewsBySourceId(String sourceId) async {
  //   Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.newsApi,
  //       {'apiKey': ApiConstant.apiKey, 'sources': sourceId});
  //   try {
  //     var response = await http.get(url);
  //     return NewsModel.fromJson(jsonDecode(response.body));
  //   } catch (e) {
  //     // ignore: use_rethrow_when_possible
  //     throw e;
  //   }
  // }

  // static Future<NewsModel?> getNewsBySearch(String? searchText) async {
  //   Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.newsApi,
  //       {'apiKey': ApiConstant.apiKey, 'q': searchText});
  //   try {
  //     var response = await http.get(url);
  //     return NewsModel.fromJson(jsonDecode(response.body));
  //   } catch (e) {
  //     // ignore: use_rethrow_when_possible
  //     throw e;
  //   }
  // }
}
