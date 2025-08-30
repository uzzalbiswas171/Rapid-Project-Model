
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Views/Screen/Auth/LoginScreen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static SharedPreferences? _prefs;
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
  }

  ///Token
  static String? getToken() => _prefs?.getString('auth_token');
  static Future setToken(String token) async => await _prefs?.setString('auth_token', token);

  ///Name
  static String? getUserName() => _prefs?.getString('user_name');
  static Future setUserName(String userName) async => await _prefs?.setString('user_name', userName);

  ///User Photo
  static String? getUserPhoto() => _prefs?.getString('user_photo');
  static Future setUserPhoto(String userPhoto) async => await _prefs?.setString('user_photo', userPhoto);

  ///User Customer Id
  static String? getUserCustomerId() => _prefs?.getString('user_customer_id');
  static Future setUserCustomerId(String userCustomerId) async => await _prefs?.setString('user_customer_id', userCustomerId);

  ///User Email
  static String? getUserCustomerEmail() => _prefs?.getString('user_customer_email');
  static Future setUserCustomerEmail(String userEmail) async => await _prefs?.setString('user_customer_email', userEmail);

  ///User Id
  static String? getUserId() => _prefs?.getString('user_id');
  static Future setUserId(String userId) async => await _prefs?.setString('user_id', userId);



}
