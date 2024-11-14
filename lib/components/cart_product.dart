import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/product.dart';
import 'package:full_proj_pks/models/cart_manager.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final Product product;

  const CartProduct({super.key, required this.product});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {

  @override
  Widget build(BuildContext context) {
    final cartManager = Provider.of<CartManager>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    widget.product.productImage,
                    height: 140, // Уменьшенная высота изображения
                    width: 140, // Уменьшенная ширина изображения
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                widget.product.productName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${widget.product.productPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(onPressed:(){cartManager.removeFromCart(widget.product, context);}, icon: Icon(Icons.delete))
            ],
          ),
        ),
      ],
    );
  }
}
