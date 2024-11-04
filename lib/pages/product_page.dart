import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(500, 237, 231, 246),
      appBar: AppBar(
        title: Text(product.productTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              product.productImage,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 1,
              fit: BoxFit.fill,
            ),
            Center(
              child: Text(
                product.productName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Описание:\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: product.productAbout,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Характеристики:\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: product.productSpecifications,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(500, 237, 231, 246),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
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
      ),
    );
  }
}