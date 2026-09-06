import 'package:flutter/material.dart';
import 'package:projectapp/model.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
    notifyListeners();
  }
  void removeFromCart(Product product) {
    cartItems.remove(product);
    notifyListeners();
  }
  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
