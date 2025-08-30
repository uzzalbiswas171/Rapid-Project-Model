

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/HttpApis/http_apis.dart';
import 'package:rapid_super_market/Core/InternetConnectionCheck/internet_connection_check.dart';
import 'package:rapid_super_market/Model/HttpModels/all_group_category_item_get_model.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:http/http.dart' as http;


class GroupCategoryItemProvider with ChangeNotifier {
  List<Group> _groups = [];
  List<Group> get groups => _groups;

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  List<popularProductModel> _items = [];
  List<popularProductModel> get items => _items;

  bool isLoading = false;


  Future<void> fetchGroupCategoryItemData() async {
    final hasInternet = await isInternetAvailable();
    if (!hasInternet) {
    //  return ApiResponse(success: false, message: 'No internet connection');
    }else{
    final url = '${HttpApi.baseUrl + HttpApi.groupCategoryItemListRoute}';
    isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        _groups = (data['group'] as List)
            .map((g) => Group.fromJson(g))
            .toList();
        _categories = (data['categories'] as List)
            .map((c) => Category.fromJson(c))
            .toList();


        _items = (data['items'] as List)
            .map((i) => popularProductModel.fromJson(i))
            .toList();
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  }
}
