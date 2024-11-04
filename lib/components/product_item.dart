import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/product.dart';
import 'package:full_proj_pks/pages/product_page.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final int index;
  final Function(int) removeProduct;

  const ProductItem({super.key, required this.product, required this.index, required this.removeProduct});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    // Здесь можно добавить логику для добавления/удаления товара из избранного
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductPage(product: widget.product,)),
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(45, 237, 231, 246),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        widget.product.productImage,
                        height: 180, // Уменьшенная высота изображения
                        width: 180, // Уменьшенная ширина изображения
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${widget.product.productPrice}₽',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(child: Text(
                    widget.product.productName,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: toggleFavorite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}