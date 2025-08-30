import 'package:flutter/cupertino.dart';

class SearchProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndexProvider(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
