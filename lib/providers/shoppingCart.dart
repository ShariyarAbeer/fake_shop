import 'package:flutter/material.dart';

class ShoppingCart with ChangeNotifier {
  List<Map<String, dynamic>> _cart = [];

  int get cartCount => _cart.length;
  List<Map<String, dynamic>> get fullCart => _cart;

  void addItems(Map<String, dynamic> item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeItems(int item) {
    _cart.removeAt(item);
    notifyListeners();
  }

  quantityRead(Map<String, dynamic> item) {
    String quantityOfItem;
    for (var i = 0; i < _cart.length; i++) {
      if (item["title"] == _cart[i]["title"]) {
        quantityOfItem = _cart[i]["quantity"].toString();
        print(_cart[i]);
        return quantityOfItem;
      }
    }
    notifyListeners();
  }

  void updateItems(Map<String, dynamic> item) {
    for (var i = 0; i < fullCart.length; i++) {
      if (item["title"] == fullCart[i]["title"]) {
        fullCart[i]["quantity"] = fullCart[i]["quantity"] + 1;
        // print(item["name"]);
        // print(fullCart);
      }
    }
    // _cart.firstWhere(item["name"]== _cart[]);
    notifyListeners();
  }

  void discriminantItems(Map<String, dynamic> item) {
    for (var i = 0; i < fullCart.length; i++) {
      if (item["title"] == fullCart[i]["title"]) {
        fullCart[i]["quantity"] = fullCart[i]["quantity"] - 1;
        // print(item["name"]);
        // print(fullCart);
      }
    }
    // _cart.firstWhere(item["name"]== _cart[]);
    notifyListeners();
  }
  // void removeItems(int item) {
  //   _cart.firstWhere(item);
  //   notifyListeners();
  // }
}
