import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/ThemeManage/theme_manage.dart';
import 'package:rapid_super_market/ViewModels/Controller/AddToCartController/add_to_cart_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/AllGroupCategoryItemController/all_group_category_item_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/CartOrderControlller/cart_order-controlller.dart';
import 'package:rapid_super_market/ViewModels/Controller/HomeController/home_controller.dart' ;
import 'package:rapid_super_market/ViewModels/Controller/OfferController/offer_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/PopularController/popular_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/SearchController/SearchController.dart';
import 'package:rapid_super_market/ViewModels/Controller/WishListController/wish_list_controller.dart';
import 'package:rapid_super_market/Views/Screen/SplashScreen/splash_loading_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => GroupCategoryItemProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => FoodData()),
        ChangeNotifierProvider(create: (_) => PopularProvider()),
        ChangeNotifierProvider(create: (_) => CartOrderProvider()),
        ChangeNotifierProvider(create: (_) => WishListController()),
        ChangeNotifierProvider(create: (_) => OfferProvider()),
        ChangeNotifierProvider(create: (_) => AddToCartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Order',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const SplashLoadingScreen(), // Change as needed
        //  home: HomeScreenTest(), // Change as needed
        //  home: const LiveTableScreen(), // Change as needed
        //  home: CustomBottomNavBar()
        //  home: ProductDetailsScreen(map: {},),
        //  home: TrackOrderScreen(),
        //  home: SubscribeScreen(),
        //  home: Notifications(),
      ),
    );
  }
}