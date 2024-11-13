import 'package:flutter/material.dart';
import 'package:full_proj_pks/components/cart_product.dart';
import 'package:full_proj_pks/models/cart_manager.dart';
import 'package:full_proj_pks/models/product.dart';
import 'package:provider/provider.dart';
import 'package:full_proj_pks/models/cart_manager.dart';

class ShoppingCart extends StatefulWidget {

  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  @override
  Widget build(BuildContext context) {
    final cartManager = Provider.of<CartManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "КОРЗИНА",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 6,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return CartProduct(product: cartManager.cartProducts[index]);
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: cartManager.cartProducts.length,
      ),
    );
  }
}
