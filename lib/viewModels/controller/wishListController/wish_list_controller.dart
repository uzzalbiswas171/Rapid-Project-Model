// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
//
// import '../../HttpApis/http_apis.dart';
// import '../../HttpFunctions/header_auth.dart';
// import '../../HttpModels/all_group_category_item_get_model.dart';
// import '../../HttpModels/recent_view_model.dart';
// import '../AllGroupCategoryItemController/all_group_category_item_controller.dart';
//
// class WishListController with ChangeNotifier{
//
//   /// recent View Product
//   List<RecentViewItemList> _wishListItemapi=[];
//   List<Item> _wishListItemMain=[];
//   List<Item> get wishListItemMain => _wishListItemMain;
//
//   bool _loadingWishList = false;
//   bool get loadingWishList => _loadingWishList;
//
//   String? _errorWishList;
//   String? get errorWishList => _errorWishList;
//
//   Future<void> fetchWishItemListProvider(String customer_id ,String purchase_item_id, BuildContext context) async {
//
//     _loadingWishList = true;
//     _errorWishList = null;
//     notifyListeners();
//     try {
//       final url = Uri.parse(HttpApi.baseUrl+HttpApi.wishListUrlRoute);
//       final response = await http.post(url,
//           body:jsonEncode({
//             'customer_id': customer_id,
//             //    'purchase_item_id': purchase_item_id,
//           }),
//           headers: await customHttpHeaders());
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List recentViewList = data['list'];
//         RecentViewItemList recentViewItemList;
//         _wishListItemapi.clear(); // Optional: clear before filling
//         _wishListItemMain.clear();
//         int count = -1;
//         for(var i in recentViewList){
//           count++;
//           recentViewItemList=RecentViewItemList.fromJson(i);
//           _wishListItemapi.add(recentViewItemList);
//           print("ssssssssssssssssssssssssssssssss${_wishListItemapi[count].id}");
//           print("ssssssssssssssss1111ssssssssssssssss${Provider.of<GroupCategoryItemProvider>(context,listen: false).items[count].id}");
//
//           final matchedItems = Provider.of<GroupCategoryItemProvider>(context,listen: false)
//               .items
//               .where((item) => item.id == '${_wishListItemapi[count].purchaseItemId}')
//               .toList();
//
//           if (matchedItems.isNotEmpty) {
//             _wishListItemMain.add(matchedItems.first);
//           }
//         }
//       } else {
//         _errorWishList = 'Failed to load banners';
//       }
//     } catch (e) {
//       _errorWishList = 'Error: $e';
//     }
//
//     _loadingWishList = false;
//     notifyListeners();
//   }
// }







import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rapid_super_market/Core/HttpApis/http_apis.dart';
import 'package:rapid_super_market/Core/HttpFunctions/header_auth.dart';
import 'package:rapid_super_market/Core/HttpFunctions/wish_list.dart';
import 'package:rapid_super_market/Core/LocalDataBase/SharePref/share_prefrence.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:rapid_super_market/Model/HttpModels/recent_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../Core/LocalDataBase/Sqlite/DbHelper/db_helper.dart';
import '../AllGroupCategoryItemController/all_group_category_item_controller.dart';



class WishListController with ChangeNotifier{

  /// recent View Product
  List<popularProductModel> _wishListItemMain=[];
  List<popularProductModel> get wishListItemMain => _wishListItemMain;

  String? _isEmpty="have";
  String? get isEmpty => _isEmpty;

  Future<void> fetchWishItemListProvider(String customer_id ,String purchase_item_id, BuildContext context) async {
    try {
      final url = Uri.parse(HttpApi.baseUrl+HttpApi.wishListUrlRoute);
      final response = await http.post(url,
          body:jsonEncode({
            'customer_id': customer_id,
        //    'purchase_item_id': purchase_item_id,
          }),
          headers: await customHttpHeaders()
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List recentViewList = data['list'];
        ///---------------------------------------------------
        RecentViewItemList recentViewItemList;
        _wishListItemMain.clear();
        _idList.clear();
        for(var i in recentViewList){
          recentViewItemList=RecentViewItemList.fromJson(i);
          List<popularProductModel> items=Provider.of<GroupCategoryItemProvider>(context, listen: false).items;
          final matchedItems = items
              .where((item) => item.id == '${recentViewItemList.purchaseItemId}')
              .toList();
          if (matchedItems.isNotEmpty) {
            _idList.add(matchedItems.first.id);
            _wishListItemMain.add(matchedItems.first);
         }
        }
        if (_wishListItemMain.isEmpty) {
          _isEmpty="Empty";
        }
        ///---------------------------------------------------
      } else {
        _isEmpty="Empty";
      }
    } catch (e) {
      debugPrint('error ----------- $e');
      _isEmpty="Empty";
    }

    notifyListeners(); // Notify for final state (loaded, empty, or error)
  }
  /// Add wish List
  dynamic addWishList;
  addWishListProvider(String customer_id, String purchase_item_id, BuildContext context)async{
    addWishList = await WishList.fetchWishListAdd(customer_id, purchase_item_id, context);
    notifyListeners();
  }
  /// Remove wish List
  dynamic removeWishList;
  removeWishListProvider(String customer_id, String purchase_item_id, BuildContext context)async{
    removeWishList = await WishList.fetchWishListRemove(customer_id, purchase_item_id, context);
    notifyListeners();
  }
  /// Add wish List
  List _idList=[];
  List get idList=> _idList;
  CreateIdListProvider(String id, BuildContext context){
    //  Provider.of<WishListController>(context,listen: false).fetchWishItemListProvider("${PrefsHelper.getUserCustomerId()}","", context);
    print("id=====> id");
    if (_idList.contains(id)) {
      print("remove $id");
      _idList.remove(id);
      removeWishListProvider("${PrefsHelper.getUserCustomerId()}", "${id}", context);
    } else {
      print("add $id");
      _idList.add(id);
      addWishListProvider("${PrefsHelper.getUserCustomerId()}", "${id}", context);
    }
    notifyListeners();
  }



  List<popularProductModel> _addToWishList = [];
  List<popularProductModel> get addToWishList => _addToWishList;

  loadaddToWishList() async {
    _addToWishList = await DBHelper().getAllFavoriteItems();
    notifyListeners();
  }

   insertDataaddToWishList(popularProductModel items) async {
    bool isGet = addToWishList.any((item) => item.id == items.id);
    if (isGet) return clearIdWiseDataaddToWishList("${items.id}");
    await DBHelper().insertFavoriteItem(items);
    await loadaddToWishList(); // refresh list
  }

  clearDataaddToWishList() async {
    DBHelper().deleteAllFavoriteItems();
    await loadaddToWishList();
  }

  clearIdWiseDataaddToWishList(String id) async {
    DBHelper().deleteFavoriteItemById(id);
    await loadaddToWishList();
  }

  updateIdWiseDataaddToWishList(String id, String columnName, String replaceValue) async {
    DBHelper().updateQty(id,columnName,replaceValue);
    await loadaddToWishList();
  }
}
