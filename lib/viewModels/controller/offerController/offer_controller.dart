import 'package:flutter/cupertino.dart';
import 'package:rapid_super_market/Core/HttpFunctions/http_function_home.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';


class OfferProvider with ChangeNotifier{
  List<popularProductModel> _popularProducts = [];
  List<popularProductModel> _todayProducts = [];
  List<popularProductModel> _recommendProducts = [];

  bool _isLoading = false;
  String? _error;

  List<popularProductModel> get popularProducts => _popularProducts;
  List<popularProductModel> get todayProducts => _todayProducts;
  List<popularProductModel> get recommendProducts => _recommendProducts;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPopularProducts() async {
    _setLoading(true);
    try {
      _popularProducts = await ProductService.fetchPopularProduct();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }

  Future<void> fetchTodayProducts() async {
   // print("data -=============>> 1");
    _setLoading(true);
    try {
    //  print("data -=============>> 2");
       _todayProducts = await ProductService.fetchTodayProduct();
     // print("data -=============>> 3 ${_todayProducts}");
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }

  Future<void> fetchRecommendProducts() async {
    _setLoading(true);
    try {
      _recommendProducts = await ProductService.fetchRecommendProduct();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}