import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:rapid_super_market/Core/HttpApis/http_apis.dart';
import 'package:rapid_super_market/Core/HttpFunctions/header_auth.dart';
import 'package:rapid_super_market/Core/InternetConnectionCheck/internet_connection_check.dart';
import 'package:rapid_super_market/Model/HttpModels/http_auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpFunctionsAuth {
  /// Registration
  static Future<ApiResponse> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final hasInternet = await isInternetAvailable();
    if (!hasInternet) {
      return ApiResponse(success: false, message: 'No internet connection');
    }else{
      final url = Uri.parse('${HttpApi.baseUrl + HttpApi.registrationRoute}');
      try {
        final response = await http.post(
            url,
            body:jsonEncode(
              {'name': name, 'email': email, 'password': password},
            ) ,
            headers: await customHttpHeaders()
        );
        debugPrint("----$name-----$email----$password------> ${response.body}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          final body = json.decode(response.body);
          final user = UserModel.fromJson(body['user']);
          final token = body['token'];
          return ApiResponse(
            success: true,
            message: body['message'] ?? 'Registration successful',
            token: token,
            user: user,
          );
        } else {
          final error = json.decode(response.body);
        //  debugPrint("-----------------${error["errors"]['email'][0]}");

          return ApiResponse(
            success: false,
            message: error["errors"]['email'][0] ?? 'Registration failed',
          );
        }
      } catch (e) {
        return ApiResponse(success: false, message: 'Something went wrong: $e');
      }
    }

  }

  /// Login

 static Future<ApiResponse> login(String email, String password,BuildContext context) async {
   final hasInternet = await isInternetAvailable();
   if (!hasInternet) {
     return ApiResponse(success: false, message: 'No internet connection');
   }else{
     final response = await http.post(
       Uri.parse(HttpApi.baseUrl + HttpApi.loginRoute),
       headers: await customHttpHeaders(),
       body: jsonEncode({
         'email': email,
         'password': password,
       }),
     );
     if (response.statusCode == 200) {

       final body = jsonDecode(response.body);
       final token = body['token'];
       final user = UserModel.fromJson(body['user']);
       final prefs = await SharedPreferences.getInstance();
       await prefs.setString('auth_token', token);
       await prefs.setString('user_name', user.fullName);
       await prefs.setString('user_name', user.fullName);

       return ApiResponse(
         success: true,
         message: body['message'] ?? 'Registration successful',
         token: token,
         user: user,
       );

       //  return {'success': true, 'user': user, 'message': body['message']};
     } else {
       debugPrint("error message ${jsonDecode(response.body)['message']?? "Login failed. Please try again"}");
       return ApiResponse(
         success: false,
         message: jsonDecode(response.body)['message'] ??
             'Login failed. Please try again.',
       );
     }
   }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token') != null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
