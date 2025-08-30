import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isInternetAvailable() async {
  final connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.none) {
    // No network (WiFi or mobile)
    return false;
  }

  // Check actual internet access
  return await InternetConnectionChecker().hasConnection;
}
