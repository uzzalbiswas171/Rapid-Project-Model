


import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart';
Future<Map<String, String>> customHttpHeaders() async {
  return {
    'Authorization': 'Bearer ${PrefsHelper.getToken().toString()}',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}