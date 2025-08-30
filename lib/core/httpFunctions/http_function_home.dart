import 'dart:convert';
import 'package:rapid_super_market/Core/HttpApis/http_apis.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';
import 'package:http/http.dart' as http;
import '../../Model/HttpModels/http_auth_model.dart';

class HttpFunctionHome{
  static Future<List<Group>> fetchGroups() async {
    final url = Uri.parse(HttpApi.baseUrl+HttpApi.groupListRoute);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List groupList = jsonData['group'];
      return groupList.map((group) => Group.fromJson(group)).toList();
    } else {
      throw Exception('Failed to load groups');
    }
  }





  static Future<List<popularProductModel>> fetchPopularProduct() async {
    List<popularProductModel> productModelUpdate=[];
    final url = Uri.parse(HttpApi.baseUrl+HttpApi.popularProductUrlRoute);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List popilarProductList = data['items'];
      popularProductModel productModel;
      for(var i in popilarProductList){
        productModel=popularProductModel.fromJson(i);
        productModelUpdate.add(productModel);
      }
   //   return popilarProductList.map((group) => popularProductModel.fromJson(group)).toList();
      return productModelUpdate;
    } else {
      throw Exception('Failed to load items');
    }
  }



  static Future<List<popularProductModel>> fetchTodayProduct() async {
    List<popularProductModel> productModelUpdate=[];
    final url = Uri.parse(HttpApi.baseUrl+HttpApi.todayOfferListUrlRoute);
    final response = await http.get(url);
    print("response ===========> ${response.body}");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List popilarProductList = data['items'];
      popularProductModel productModel;
      for(var i in popilarProductList){
        productModel=popularProductModel.fromJson(i);
        productModelUpdate.add(productModel);
      }
      //   return popilarProductList.map((group) => popularProductModel.fromJson(group)).toList();
      return productModelUpdate;
    } else {
      throw Exception('Failed to load items');
    }
  }


  static Future<List<popularProductModel>> fetchRecommendProduct() async {
    List<popularProductModel> recommandModelUpdate=[];
    final url = Uri.parse(HttpApi.baseUrl+HttpApi.recommendProductUrlRoute);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List popilarProductList = data['items'];
      popularProductModel productModel;
      for(var i in popilarProductList){
        productModel=popularProductModel.fromJson(i);
        recommandModelUpdate.add(productModel);
      }
   //   return popilarProductList.map((group) => popularProductModel.fromJson(group)).toList();
      return recommandModelUpdate;
    } else {
      throw Exception('Failed to load items');
    }
  }



}







class ProductService {
  static Future<List<popularProductModel>> _fetchProductByRoute(String route) async {
    final url = Uri.parse(HttpApi.baseUrl + route);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> items = data['items'];

        return items.map((item) => popularProductModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load items. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error fetching products: $e');
      rethrow;
    }
  }

  static Future<List<popularProductModel>> fetchPopularProduct() {
    return _fetchProductByRoute(HttpApi.popularProductUrlRoute);
  }

  static Future<List<popularProductModel>> fetchTodayProduct() {
    return _fetchProductByRoute(HttpApi.todayOfferListUrlRoute);
  }

  static Future<List<popularProductModel>> fetchRecommendProduct() {
    return _fetchProductByRoute(HttpApi.recommendProductUrlRoute);
  }
}
















