import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/InternetConnectionCheck/internet_connection_check.dart';
import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart';
import 'package:rapid_super_market/ViewModels/Controller/AllGroupCategoryItemController/all_group_category_item_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/HomeController/home_controller.dart';
import 'package:rapid_super_market/ViewModels/Controller/WishListController/wish_list_controller.dart';
import 'package:provider/provider.dart';
class RefreshProviderFunctions{

  static homeCheckInternetGetData(BuildContext context)async{
    debugPrint("Home App Api Get ==============> ");
    final hasInternet = await isInternetAvailable();
    if (!hasInternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Internet")));
    }else{
      Provider.of<GroupCategoryItemProvider>(context,listen: false).fetchGroupCategoryItemData();
      Provider.of<HomeProvider>(context,listen: false).fetchGroupProvider();
      Provider.of<HomeProvider>(context,listen: false).fetchBannersProvider();
      Provider.of<HomeProvider>(context,listen: false).loadPopularProductProvider();
      Provider.of<HomeProvider>(context,listen: false).loadRecommandProductProvider();
      Provider.of<HomeProvider>(context,listen: false).fetchRecentViewItemListProvider("${PrefsHelper.getUserCustomerId()}","", context);
    }
  }

  static wishListCheckInternetGetData(BuildContext context)async{
    debugPrint("Wish List Api Get ==============> ");
    final hasInternet = await isInternetAvailable();
    if (!hasInternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Internet")));
    }else{
      Provider.of<WishListController>(context,listen: false).fetchWishItemListProvider("${PrefsHelper.getUserCustomerId()}","", context);
    }
  }

  static wishListGetRemoveCheckInternetGetData(String id, BuildContext context)async{
    debugPrint("Wish List Api Get Remove ==============> ");
    final hasInternet = await isInternetAvailable();
    if (!hasInternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Internet")));
    }else{
      Provider.of<WishListController>(context,listen: false).CreateIdListProvider("${id}", context);
    }
  }

}