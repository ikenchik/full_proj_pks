import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/product.dart';
import 'package:full_proj_pks/models/cart_manager.dart';
import 'package:provider/provider.dart';
import 'package:full_proj_pks/pages/product_page.dart';

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
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductPage(product: widget.product,)),
      ),
      child: Stack(
        children: [Row(
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
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 16),
                    Text(
                      widget.product.productName,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\₽${widget.product.productPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
          Positioned(
            bottom: 0,
            left: 165,
            child: IconButton(onPressed:(){cartManager.removeFromCart(widget.product, context);}, icon: Icon(Icons.delete_outline)),
          ),
      ]
      ),
    );
  }
}
