import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/model/home_tab_model.dart';
import 'package:movies/model/login_model.dart';
import 'package:movies/model/user_model.dart';
import 'package:movies/services.dart';
import 'package:movies/utils/api_constant.dart';
import 'package:movies/utils/end_points.dart';

import '../model/register_model.dart';

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

  static Future<HomeTabModel?> getMoviesByCategoryName(String catName) async {
    Uri url = Uri.https(
        ApiConstant.moviesBaseUrl, EndPoints.listMovies, {'genre': catName});
    try {
      var response = await http.get(url);
      return HomeTabModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      // ignore: use_rethrow_when_possible
      return null;
    }
  }

  static Future<LoginModel?> loginByEmailAndPassword(
    String userEmail,
    String userPassword,
  ) async {
    Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.login);

    Map<String, dynamic> requestBody = {
      "email": userEmail,
      "password": userPassword,
    };

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      return LoginModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }

  static Future<RegisterModel?> register({
    required String userName,
    required String userEmail,
    required String userPassword,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  }) async {
    Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.register);

    Map<String, dynamic> requestBody = {
      "name": userName,
      "email": userEmail,
      "password": userPassword,
      "confirmPassword": confirmPassword,
      "phone": phone,
      "avaterId": avaterId,
    };

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      return RegisterModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel?> getUserData() async {
    Uri url = Uri.https(
      ApiConstant.userBaseUrl,
      EndPoints.profile,
    );
    try {
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${MyServices.getString("Token")}",
        },
      );
      return UserModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }
}
