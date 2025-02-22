  import 'dart:convert';

  import 'package:connectivity_plus/connectivity_plus.dart';
  import 'package:http/http.dart' as http;

  class ApiService {
    static Future<bool> hasInternet() async {
      var connectivityResult = await Connectivity().checkConnectivity();
      // ignore: unrelated_type_equality_checks
      return connectivityResult != ConnectivityResult.none;
    }

    static Future<dynamic> makeRequest(
        {required Uri url, String method = "GET", Map<String, String>? headers, dynamic body}) async {
      if (!await hasInternet()) {
        return Future.error("No Internet Connection");
      }

      http.Response response;
      try {
        if (method == "POST") {
          response = await http.post(url, headers: headers, body: jsonEncode(body));
          print(jsonEncode(body)) ;
        } else if (method == "PATCH") {
          response = await http.patch(url, headers: headers, body: jsonEncode(body));    
        } else if (method == "DELETE") {
          response = await http.delete(url, headers: headers);
        } else {
          response = await http.get(url, headers: headers);
        }

        if (response.statusCode >= 200 && response.statusCode < 300) {
          return jsonDecode(response.body);
        } else {
          return Future.error("Error: ${response.statusCode} - ${response.body}");
        }
      } catch (e) {
        return Future.error("Request failed: $e");
      }
    }
  }
