import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/Const/image_const.dart';
import 'package:rapid_super_market/Core/HttpApis/refreshItem.dart';
import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart';
import 'package:rapid_super_market/Views/Screen/BottomNavBar/bottom_nav_bar.dart';
import 'package:rapid_super_market/Views/Screen/SplashScreen/main_splash_screen.dart';
import 'package:provider/provider.dart';

class SplashLoadingScreen extends StatefulWidget {
  const SplashLoadingScreen({super.key});

  @override
  State<SplashLoadingScreen> createState() => _SplashLoadingScreenState();
}

class _SplashLoadingScreenState extends State<SplashLoadingScreen> {

  @override
  void initState() {
    RefreshProviderFunctions.homeCheckInternetGetData(context);
    debugPrint("Splash Screen Check Token ===> ${PrefsHelper.getToken()}");
    Future.delayed(Duration(seconds: 3),() {
      if(PrefsHelper.getToken() != null){
        return Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBottomNavBar(),));
      }else{
        return Navigator.push(context, MaterialPageRoute(builder: (context) => MainSplashScreen(),));
      }
    },);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final circleRadius = screenWidth * 0.3; // 30% of screen width
    final imageSize = circleRadius * 1.6;    // image fits inside

    return Scaffold(
      backgroundColor: ColorConst.baseColor,
      body: Center(
        child: CircleAvatar(
          radius: circleRadius,
          backgroundColor: ColorConst.baseColor.withValues(alpha: 0.0),
          child: ClipOval(
            child: Image.asset(
              ImageConst.logo,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

}
