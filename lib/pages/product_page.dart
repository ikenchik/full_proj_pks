import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(234, 213, 208, 208),
      appBar: AppBar(
        title: Text(product.productTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              product.productName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.network(
            product.productImage,
            height: 265,
            width: 300,
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              '${product.productPrice}₽',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              product.productAbout,
            ),
          ),
          Center(
            child: Text(
              product.productSpecifications,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: (){},
                      child: const Text("В корзину"),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: ElevatedButton(onPressed: (){},
                      child: const Text("Купить"),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                        backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}