import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int counter = 0;
  double totalPrice = 0.0;

// shared preferences set
  void setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', counter);
    prefs.setDouble('total price', totalPrice);
    notifyListeners();
  }

// shared preferences get
  void getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('cart_item') ?? 0;
    totalPrice = prefs.getDouble('total price') ?? 0.0;
    notifyListeners();
  }

// functions for quantity of products

// add products in cart
  void addCounter() {
    counter++;
    setPrefItems();
    notifyListeners();
  }

// remove products from cart
  void removeCounter() {
    counter--;
    setPrefItems();
    notifyListeners();
  }

// get total products that left as a result
  int getCounter() {
    getPrefItems();
    return counter;
  }

// functions for total price for products

// addition in total price
  void addTotalPrice(double productPrice) {
    totalPrice = totalPrice + productPrice;
    setPrefItems();
    notifyListeners();
  }

// deduction in total price
  void removeTotalPrice(double productPrice) {
    totalPrice = totalPrice - productPrice;
    setPrefItems();
    notifyListeners();
  }

// get totalprice as a sum of all products price
  double getTotalPrice() {
    getPrefItems();
    return totalPrice;
  }
}
