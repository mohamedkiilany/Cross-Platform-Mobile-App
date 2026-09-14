import 'package:flutter/material.dart';
import 'package:projectapp/cart_db.dart';
import 'package:projectapp/model.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartItems = [];

  void addToCart(Product product) async {
    cartItems.add(product);
    notifyListeners();
    await CartDb().addProuduct(product);
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
