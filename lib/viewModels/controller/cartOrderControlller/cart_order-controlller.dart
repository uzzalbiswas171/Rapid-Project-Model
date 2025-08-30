import 'package:flutter/cupertino.dart';

class CartOrderProvider with ChangeNotifier{
  bool _selectedButton = false;
  get selectedButton => _selectedButton;

  void setSelectedButton(bool index) {
    _selectedButton = index;
    notifyListeners();
  }

}