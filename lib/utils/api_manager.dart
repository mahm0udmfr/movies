// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:movies/model/news_model.dart';
// import 'package:movies/model/source_response.dart';
// import 'package:movies/utils/api_constant.dart';
// import 'package:movies/utils/end_points.dart';

// class ApiManager {
//   ///https://newsapi.org/v2/top-headlines/sources?apiKey=84c34fd58ebe4efb98b64134a005e514
//   ///
//   ///
//   static Future<SourceResponce?> getSources(String catId) async {
//     Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.sourceApi,
//         {'apiKey': ApiConstant.apiKey,'category' : catId});
//     try {
//       var response = await http.get(url);
//       return SourceResponce.fromJson(jsonDecode(response.body));
//     } catch (e) {
//       // ignore: use_rethrow_when_possible
//     return null;
//     }
//   }

// // https://newsapi.org/v2/everything?q=bitcoin&apiKey=84c34fd58ebe4efb98b64134a005e514

//   static Future<NewsModel?> getNewsBySourceId(String sourceId) async {
//     Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.newsApi,
//         {'apiKey': ApiConstant.apiKey, 'sources': sourceId});
//     try {
//       var response = await http.get(url);
//       return NewsModel.fromJson(jsonDecode(response.body));
//     } catch (e) {
//       // ignore: use_rethrow_when_possible
//       throw e;
//     }
//   }


//     static Future<NewsModel?> getNewsBySearch(String? searchText) async {
//     Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.newsApi,
//         {'apiKey': ApiConstant.apiKey, 'q': searchText});
//     try {
//       var response = await http.get(url);
//       return NewsModel.fromJson(jsonDecode(response.body));
//     } catch (e) {
//       // ignore: use_rethrow_when_possible
//       throw e;
//     }
//   }
// }
