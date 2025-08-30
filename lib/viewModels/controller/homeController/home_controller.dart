import 'dart:convert';

import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';
import 'package:rapid_super_market/Core/HttpApis/http_apis.dart';
import 'package:rapid_super_market/Core/HttpFunctions/header_auth.dart';
import 'package:rapid_super_market/Core/HttpFunctions/http_function_home.dart';
import 'package:rapid_super_market/Model/HttpModels/banner_model.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:rapid_super_market/Model/HttpModels/recent_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../Model/CategoryModel/category_model.dart';
import '../../../Model/HttpModels/http_auth_model.dart';
import '../AllGroupCategoryItemController/all_group_category_item_controller.dart';

class FoodData with ChangeNotifier {















  // Dummy Data for demonstration
  List<String> _carouselImages = [
 "https://i.ytimg.com/vi/GbRjDxkDIyA/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCsqH5_aqHoNZXbog5M6gdVw2CBnw",
  "https://usercontent.one/wp/www.orderyoyo.com/wp-content/uploads/2023/10/Buffet-Table-Plates-Olives.png?media=1727872772",
    "https://singapore.intercontinental.com/sites/ihg-sg/files/inline-images/Buffet-1200x628.jpg",
    "https://singapore.intercontinental.com/sites/ihg-sg/files/inline-images/Buffet-1200x628.jpg",
 "https://i.ytimg.com/vi/GbRjDxkDIyA/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCsqH5_aqHoNZXbog5M6gdVw2CBnw",
  "https://usercontent.one/wp/www.orderyoyo.com/wp-content/uploads/2023/10/Buffet-Table-Plates-Olives.png?media=1727872772",
    "https://singapore.intercontinental.com/sites/ihg-sg/files/inline-images/Buffet-1200x628.jpg",
    "https://singapore.intercontinental.com/sites/ihg-sg/files/inline-images/Buffet-1200x628.jpg",
  ];

  List<Category> _categories = [
    Category(
      id: 'c1',
      name: 'Burger',
      imageUrl: 'https://img.lovepik.com/photo/48005/8825.jpg_wh860.jpg',
      bgColor: ColorConst.baseColor.withValues(alpha: 0.5),
    ),
    Category(
      id: 'c2',
      name: 'Pizza',
      imageUrl: 'https://slicelife.imgix.net/47972/photos/original/product-margherita-square-pizza-9554380.jpeg?auto=compress&auto=format',
      bgColor: Colors.red.shade50,
    ),
    Category(
      id: 'c3',
      name: 'Sandwich',
      imageUrl: 'https://www.spicebangla.com/wp-content/uploads/2024/07/Vegetable-Sandwich-Recipe01.webp',
      bgColor: Colors.green.shade50,
    ),
    Category(
      id: 'c4',
      name: 'Dessert',
      imageUrl: 'https://www.aljazeera.com/wp-content/uploads/2024/10/AP24281375166885-1728390559.jpg?resize=1920%2C1080',
      bgColor: Colors.purple.shade50,
    ),
    Category(
      id: 'c5',
      name: 'Drinks',
      imageUrl: 'https://media.istockphoto.com/id/1179439557/vector/gift-card-with-blue-bow.jpg?s=612x612&w=0&k=20&c=1mfaKwLlxd3eNpWzrnHh4H6R5dlwcePljfFQX9HMrpM=',
      bgColor: Colors.blue.shade50,
    ),
    Category(
      id: 'c1',
      name: 'Burger',
      imageUrl: 'https://img.lovepik.com/photo/48005/8825.jpg_wh860.jpg',
      bgColor: ColorConst.baseColor.withValues(alpha: 0.5),
    ),
    Category(
      id: 'c2',
      name: 'Pizza',
      imageUrl: 'https://slicelife.imgix.net/47972/photos/original/product-margherita-square-pizza-9554380.jpeg?auto=compress&auto=format',
      bgColor: Colors.red.shade50,
    ),
    Category(
      id: 'c3',
      name: 'Sandwich',
      imageUrl: 'https://www.spicebangla.com/wp-content/uploads/2024/07/Vegetable-Sandwich-Recipe01.webp',
      bgColor: Colors.green.shade50,
    ),
  ];

  final List<FoodItem> _popularFoodItems = [
    FoodItem(
        id: 'p1',
        name: 'Classic Burger',
        imageUrl: 'https://media.istockphoto.com/id/1179439557/vector/gift-card-with-blue-bow.jpg?s=612x612&w=0&k=20&c=1mfaKwLlxd3eNpWzrnHh4H6R5dlwcePljfFQX9HMrpM=',
        price: 35.00,
        rating: 4.5),
    FoodItem(
        id: 'p2',
        name: 'Pepperoni Pizza',
        imageUrl: 'https://media.istockphoto.com/id/1179439557/vector/gift-card-with-blue-bow.jpg?s=612x612&w=0&k=20&c=1mfaKwLlxd3eNpWzrnHh4H6R5dlwcePljfFQX9HMrpM=',
        price: 55.00,
        rating: 4.8),
    FoodItem(
        id: 'p3',
        name: 'Club Sandwich',
        imageUrl: 'https://media.istockphoto.com/id/1179439557/vector/gift-card-with-blue-bow.jpg?s=612x612&w=0&k=20&c=1mfaKwLlxd3eNpWzrnHh4H6R5dlwcePljfFQX9HMrpM=',
        price: 28.00,
        rating: 4.2),
    FoodItem(
        id: 'p3',
        name: 'Club Sandwich',
        imageUrl: 'https://media.istockphoto.com/id/1179439557/vector/gift-card-with-blue-bow.jpg?s=612x612&w=0&k=20&c=1mfaKwLlxd3eNpWzrnHh4H6R5dlwcePljfFQX9HMrpM=',
        price: 28.00,
        rating: 4.2),
    FoodItem(
        id: 'p3',
        name: 'Club Sandwich',
        imageUrl: 'https://media.istockphoto.com/id/1179439557/vector/gift-card-with-blue-bow.jpg?s=612x612&w=0&k=20&c=1mfaKwLlxd3eNpWzrnHh4H6R5dlwcePljfFQX9HMrpM=',
        price: 28.00,
        rating: 4.2),
    FoodItem(
        id: 'p3',
        name: 'Club Sandwich',
        imageUrl: 'https://media.istockphoto.com/id/1179439557/vector/gift-card-with-blue-bow.jpg?s=612x612&w=0&k=20&c=1mfaKwLlxd3eNpWzrnHh4H6R5dlwcePljfFQX9HMrpM=',
        price: 28.00,
        rating: 4.2),
  ];

  List<String> get carouselImages => [..._carouselImages];
  List<Category> get categories => [..._categories];
  List<FoodItem> get popularFoodItems => [..._popularFoodItems];

}





class HomeProvider with ChangeNotifier {
  List<Group> _groupList = [];
  List<Group> get groupList => _groupList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchGroupProvider() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _groupList = await HttpFunctionHome.fetchGroups();
      if (_groupList.isEmpty) {
        _error = 'No data found';
      }
    } catch (e) {
      _error = 'Failed to load groups';
    }

    _isLoading = false;
    notifyListeners();
  }




  List<BannerItem> _heroBanners = [];
  List<BannerItem> _smallBanners = [];
  bool _isLoadingBanner = false;
  String? _errorBanner;

  List<BannerItem> get heroBanners => _heroBanners;
  List<BannerItem> get smallBanners => _smallBanners;
  bool get isLoadingBanner => _isLoadingBanner;
  String? get errorBanner => _errorBanner;

  Future<void> fetchBannersProvider() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final url = Uri.parse(HttpApi.baseUrl+HttpApi.baseUrlRoute);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final bannerResponse = BannerResponse.fromJson(jsonData);
        _heroBanners = bannerResponse.heroBanners;
        _smallBanners = bannerResponse.smallBanners;
      } else {
        _error = 'Failed to load banners';
      }
    } catch (e) {
      _error = 'Error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }



  List<popularProductModel> _itemsPopularProduct=[];
  bool _isLoadingPopularProduct = false;
  List<popularProductModel> get itemsPopularProduct => _itemsPopularProduct;
  bool get isLoadingPopularProduct => _isLoadingPopularProduct;
  Future<void> loadPopularProductProvider() async {
    _isLoadingPopularProduct = true;
    notifyListeners();
    try {
      _itemsPopularProduct = await HttpFunctionHome.fetchPopularProduct();
    } catch (e) {
      debugPrint(" ddddd ==========> $e");
    }
    _isLoadingPopularProduct = false;
    notifyListeners();
  }

/// Popular product
  List<popularProductModel> _itemsRecommandProduct=[];
  bool _isLoadingRecommandProduct = false;
  List<popularProductModel> get itemsRecommandProduct => _itemsRecommandProduct;
  bool get isLoadingRecommandProduct => _isLoadingRecommandProduct;
  Future<void> loadRecommandProductProvider() async {
    _isLoadingRecommandProduct = true;
    notifyListeners();
    try {
      _itemsRecommandProduct = await HttpFunctionHome.fetchRecommendProduct();
    } catch (e) {
      if (kDebugMode) {
        debugPrint(" ddddd ==========> $e");
      }
    }
    _isLoadingRecommandProduct = false;
    notifyListeners();
  }

/// recent View Product
  List<RecentViewItemList> _recentViewItemListapi=[];
  List<popularProductModel> _recentViewItemList=[];
  List<popularProductModel> get recentViewItemList => _recentViewItemList;

  bool _recentViewItemListLoading = false;
  bool get recentViewItemListLoading => _recentViewItemListLoading;

  String? _recentViewItemListError;
  String? get recentViewItemListError => _recentViewItemListError;

  Future<void> fetchRecentViewItemListProvider(String customer_id ,String purchase_item_id, BuildContext context) async {

    _recentViewItemListLoading = true;
    _recentViewItemListError = null;
    notifyListeners();
    try {
      final url = Uri.parse(HttpApi.baseUrl+HttpApi.recentViewUrlRoute);
      final response = await http.post(url,
          body:jsonEncode({
            'customer_id': customer_id,
        //    'purchase_item_id': purchase_item_id,
          }),
          headers: await customHttpHeaders());
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List recentViewList = data['list'];
        RecentViewItemList recentViewItemList;
        _recentViewItemListapi.clear(); // Optional: clear before filling
        _recentViewItemList.clear();
        int count = -1;

        for(var i in recentViewList){
          count++;
          recentViewItemList=RecentViewItemList.fromJson(i);
          _recentViewItemListapi.add(recentViewItemList);
          List<popularProductModel> items=Provider.of<GroupCategoryItemProvider>(context,listen: false).items;
          final matchedItems =  items
              .where((item) => item.id == '${_recentViewItemListapi[count].purchaseItemId}')
              .toList();

          if (matchedItems.isNotEmpty) {
            _recentViewItemList.add(matchedItems.first);
          }
        }
      } else {
        _recentViewItemListError = 'Failed to load banners';
      }
    } catch (e) {
      _recentViewItemListError = 'Error: $e';
    }
    _recentViewItemListLoading = false;
    notifyListeners();
  }




}





