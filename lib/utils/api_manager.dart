import 'package:movies/model/home_tab_model.dart';
import 'package:movies/model/login_model.dart';
import 'package:movies/model/movie_details_model.dart';
import 'package:movies/model/movie_suggestions.dart';
import 'package:movies/model/reset_password_model.dart';
import 'package:movies/model/search_tab_model.dart';
import 'package:movies/model/update_profile_model.dart';
import 'package:movies/model/user_model.dart';
import 'package:movies/services.dart';
import 'package:movies/utils/api_constant.dart';
import 'package:movies/utils/api_services.dart';
import 'package:movies/utils/end_points.dart';
import '../model/register_model.dart';

class ApiManager {
  static Future<HomeTabModel?> getMovies() async {
    Uri url = Uri.https(ApiConstant.moviesBaseUrl, EndPoints.listMovies);
    try {
      var jsonResponse = await ApiService.makeRequest(url: url);
      return HomeTabModel.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }

  static Future<SearchTabModel?> searchMovie(String movieTitle) async {
    Uri url = Uri.https(
      ApiConstant.moviesBaseUrl,
      EndPoints.listMovies,
      {'query_term': movieTitle},
    );
    try {
      var jsonResponse = await ApiService.makeRequest(url: url);
      return SearchTabModel.fromJson(jsonResponse);
    } catch (e) {
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
      var jsonResponse = await ApiService.makeRequest(url: url);
      return MovieDetailsModel.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }

  static Future<HomeTabModel?> getMoviesByCategoryName(String catName) async {
    Uri url = Uri.https(
      ApiConstant.moviesBaseUrl,
      EndPoints.listMovies,
      {'genre': catName},
    );
    try {
      var jsonResponse = await ApiService.makeRequest(url: url);
      return HomeTabModel.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }

  static Future<LoginModel?> loginByEmailAndPassword(String userEmail, String userPassword) async {
    Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.login);
    Map<String, dynamic> requestBody = {
      "email": userEmail,
      "password": userPassword,
    };

    try {
      var jsonResponse = await ApiService.makeRequest(
        url: url,
        method: "POST",
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      return LoginModel.fromJson(jsonResponse);
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
      var jsonResponse = await ApiService.makeRequest(
        url: url,
        method: "POST",
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      return RegisterModel.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel?> getUserData() async {
    Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.profile);
    try {
      var jsonResponse = await ApiService.makeRequest(
        url: url,
        headers: {"Authorization": "Bearer ${MyServices.getString("Token")}"},
      );
      return UserModel.fromJson(jsonResponse);
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
      var jsonResponse = await ApiService.makeRequest(
        url: url,
        method: "PATCH",
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${MyServices.getString("Token")}"
        },
        body: requestBody,
      );
      return UpdateProfileModel.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }

  static Future<UpdateProfileModel?> deleteProfile() async {
    Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.profile);
    try {
      var jsonResponse = await ApiService.makeRequest(
        url: url,
        method: "DELETE",
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${MyServices.getString("Token")}"
        },
      );
      return UpdateProfileModel.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }

  static Future<ResetPasswordModel?> resetPassword({
    required String oldPass,
    required String newPass,
  }) async {
    try {
      String? token = MyServices.getString("Token"); 
      if (token == null) {
        return Future.error("Token not found");
      }

      Uri url = Uri.https(ApiConstant.userBaseUrl, EndPoints.resetPassword);
      Map<String, dynamic> requestBody = {
        "oldPassword": oldPass,
        "newPassword": newPass
      };

      var jsonResponse = await ApiService.makeRequest(
        url: url,
        method: "PATCH",
        headers: {"Authorization": "Bearer $token"},
        body: requestBody,
      );

      return ResetPasswordModel.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }

  static Future<SuggestionResponse?> suggestions({required String movieId}) async {
    Uri url = Uri.https(ApiConstant.moviesBaseUrl, EndPoints.suggestions, {'movie_id': movieId});
    try {
      var jsonResponse = await ApiService.makeRequest(url: url);
      return SuggestionResponse.fromJson(jsonResponse);
    } catch (e) {
      return null;
    }
  }
}
