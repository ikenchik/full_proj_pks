import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/cart_manager.dart';
import 'package:full_proj_pks/models/product.dart';
import 'package:provider/provider.dart';

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
            return const Center(
              child: Flex(
                direction: Axis.horizontal, // Указываем направление строки
                mainAxisAlignment: MainAxisAlignment.center, // Выравнивание по центру строки
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("УДАЧНО")
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: cartManager.cartProducts.length,
      ),
    );
  }
}
