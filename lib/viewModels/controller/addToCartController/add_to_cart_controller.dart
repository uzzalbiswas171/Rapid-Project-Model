import 'package:flutter/foundation.dart';
import 'package:rapid_super_market/Core/LocalDataBase/Sqlite/DbHelper/db_helper.dart';
import 'package:rapid_super_market/Model/HttpModels/product_model.dart';


class AddToCartProvider with ChangeNotifier {
  List<popularProductModel> _addToCartList = [];

  List<popularProductModel> get addToCartList => _addToCartList;

  loadAddToCartList() async {
    _addToCartList = await DBHelper().getAllItems();
    getTotalAmount();
    notifyListeners();
  }

  insertDataAddToCartList(popularProductModel items) async {
    bool isGet = addToCartList.any((item) => item.id == items.id);
    if (isGet) return;
    await DBHelper().insertItem(items);
    await loadAddToCartList(); // refresh list
  }

  clearDataAddToCartList() async {
     DBHelper().deleteAllItems();
     await loadAddToCartList();
  }

  clearIdWiseDataAddToCartList(String id) async {
     DBHelper().deleteItemById(id);
     await loadAddToCartList();
  }

  updateIdWiseDataAddToCartList(String id, String columnName, String replaceValue) async {
     DBHelper().updateQty(id,columnName,replaceValue);
     await loadAddToCartList();
  }

  double _totalAmount = 0;
  double get totalAmount => _totalAmount;

   getTotalAmount(){
    _totalAmount = 0;
    for (var item in _addToCartList) {
      final int quantity = int.tryParse(item.qty ?? '0') ?? 0;
      final double price = double.tryParse(item.price ?? '0') ?? 0.0;
      _totalAmount += quantity * price;
    }
    notifyListeners();
  }

}

double priceCalculationController(String qty,String price){
  return int.parse("${qty}") * double.parse("${price}");
}