

import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart' show PrefsHelper;
import 'package:get_storage/get_storage.dart';

import 'apps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await PrefsHelper.init();
  runApp(const MyApp());
}





