import 'package:flutter/cupertino.dart';

class PopularProvider with ChangeNotifier{

 int _selectedIndex = 0;
 get selectedIndex => _selectedIndex;
 void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


 int _selectedList = 0;
 get selectedList => _selectedList;
 void setSelectedList(int index) {
   _selectedList = index;
    notifyListeners();
  }

  // Popular product Shorting
 bool _list = false;
 get popularItemsShort => _list;
 void setPopularItemsShort() {
   _list = !_list;
   notifyListeners();
 }



}