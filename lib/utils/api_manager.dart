import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/model/home_tab_model.dart';
import 'package:movies/model/login_model.dart';
import 'package:movies/model/movie_details_model.dart';
import 'package:movies/model/movie_suggestions.dart';
import 'package:movies/model/reset_password_model.dart';
import 'package:movies/model/update_profile_model.dart';
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

  static Future<MovieDetailsModel?> getMovieDetail({required String movieId}) async {
    Uri url = Uri.https(
      ApiConstant.moviesBaseUrl,
      EndPoints.moviedetails,
      {'movie_id': movieId, 'with_images': 'true', 'with_cast': 'true'},
    );

    try {
      var response = await http.get(url);
      return MovieDetailsModel.fromJson(jsonDecode(response.body));
    } catch (e) {
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

  static Future<UpdateProfileModel?> updateUserNameAndPhone({
    required String userName,
    required String phone,
    required int avaterId,
  }) async {
    Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.profile);

    Map<String, dynamic> requestBody = {
      "name": userName,
      "phone": phone,
      "avaterId": avaterId,
    };

    try {
      var response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${MyServices.getString("Token")}"
        },
        body: jsonEncode(requestBody),
      );
      return UpdateProfileModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }

  static Future<UpdateProfileModel?> deleteProfile() async {
    Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.profile);

    try {
      var response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${MyServices.getString("Token")}"
        },
      );
      return UpdateProfileModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }

  static Future<ResetPasswordModel?> resetPassword({
    required String oldPass,
    required String newPass,
  }) async {
    try {
      String? token =
          MyServices.getString("Token"); //get oken from shared prefrences
      if (token == null) {
        return Future.error("token doesn't found");
      }
      Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.resetPassword);

      var response = await http.patch(url,
          headers: {"AUTHORIZATION": "Bearer $token"},
          body: {"oldPassword": oldPass, "newPassword": newPass});

      return ResetPasswordModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  static Future<MovieSuggestions?> suggestions(
      {required String movieId}) async {
    Uri url = Uri.https(ApiConstant.moviesBaseUrl, EndPoints.suggestions,
        {'movie_id': movieId});
    try {
      var response = await http.get(url);
      return MovieSuggestions.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }
}
