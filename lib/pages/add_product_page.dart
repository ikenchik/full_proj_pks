import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/product.dart';
import 'package:provider/provider.dart';
import 'package:full_proj_pks/models/product_manager.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController productTitleController = TextEditingController();
  final TextEditingController productImageController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productAboutController = TextEditingController();
  final TextEditingController productSpecificationController = TextEditingController();

  @override
  void dispose() {
    productTitleController.dispose();
    productImageController.dispose();
    productPriceController.dispose();
    productAboutController.dispose();
    productSpecificationController.dispose();
    super.dispose();
  }

  void _createProduct(BuildContext context) {
    final productTitle = productTitleController.text;
    final productImage = productImageController.text;
    final productPrice = int.tryParse(productPriceController.text) ?? 0;
    final productAbout = productAboutController.text;
    final productSpecifications = productSpecificationController.text;

    if (productTitle.isNotEmpty && productImage.isNotEmpty && productPrice > 0 && productAbout.isNotEmpty && productSpecifications.isNotEmpty) {
      final newProduct = Product(
        productId: DateTime.now().millisecondsSinceEpoch, // Генерация уникального ID
        productTitle: productTitle,
        productImage: productImage,
        productName: productTitle, // Предположим, что название и имя совпадают
        productPrice: productPrice,
        productAbout: productAbout,
        productSpecifications: productSpecifications,
      );

      final productManager = Provider.of<ProductManager>(context, listen: false);
      productManager.addToProducts(newProduct);

      Navigator.pop(context, newProduct); // Возвращаем новый продукт обратно
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Пожалуйста, заполните все поля корректно.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление товара"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: productTitleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите название товара",
                  labelText: "Название",
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: productImageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите ссылку на изображение",
                  labelText: "Ссылка",
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: productPriceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите стоимость товара",
                  labelText: "Стоимость",
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: productAboutController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите описание товара",
                  labelText: "Описание",
                ),
                maxLines: 7,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: productSpecificationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите характеристики товара",
                  labelText: "Характеристики",
                ),
                maxLines: 7,
              ),
              const SizedBox(height: 16),

              //кнопка перехода к методу создания экземпляра класса Product
              ElevatedButton(
                onPressed: () => _createProduct(context),
                child: const Text("Добавить товар",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: const Size(300, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}