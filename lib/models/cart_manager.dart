import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/product.dart';

class CartManager with ChangeNotifier{
  final List<Product> _cartProducts = <Product>[];

  List<Product> get cartProducts => _cartProducts;

  void addToCart(Product product){
    if (!_cartProducts.contains(product)){
      _cartProducts.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Product product){
    _cartProducts.remove(product);
    notifyListeners();
  }

  bool isInCart(Product product){
    return _cartProducts.contains(product);
  }
}