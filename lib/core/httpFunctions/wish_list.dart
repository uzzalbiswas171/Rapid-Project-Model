import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:rapid_super_market/Core/HttpApis/refreshItem.dart';
import '../HttpApis/http_apis.dart';
import 'header_auth.dart';
import 'package:http/http.dart' as http ;

class WishList{



 static fetchWishListAdd(String customer_id, String purchase_item_id, BuildContext context)async{
    try {
      final url = Uri.parse(HttpApi.baseUrl+HttpApi.addWishListUrlRoute);
      final response = await http.post(url,
          body:jsonEncode({
            'customer_id': customer_id,
            'purchase_item_id': purchase_item_id,
          }),
          headers: await customHttpHeaders()
    );

    if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print("$data");
    RefreshProviderFunctions.wishListCheckInternetGetData(context);
    } else {
    debugPrint("error---------${response.body}");
    }
    } catch (e) {
      debugPrint("error---------$e");
    }
  }

 static fetchWishListRemove(String customer_id, String purchase_item_id, BuildContext context)async{
    try {
      final url = Uri.parse(HttpApi.baseUrl+HttpApi.removeWishListUrlRoute);
      final response = await http.post(url,
          body:jsonEncode({
            'customer_id': customer_id,
            'purchase_item_id': purchase_item_id,
          }),
          headers: await customHttpHeaders()
    );

    if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print("$data");
    RefreshProviderFunctions.wishListCheckInternetGetData(context);
    } else {
    debugPrint("error---------${response.body}");
    }
    } catch (e) {
      debugPrint("error---------$e");
    }
  }

}