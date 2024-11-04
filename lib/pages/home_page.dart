import 'package:flutter/material.dart';
import 'package:full_proj_pks/components/product_item.dart';
import 'package:full_proj_pks/models/product.dart';
import 'package:full_proj_pks/pages/add_product_page.dart';

final List<Product> products = <Product>[
  Product(productId: 1,
      productTitle: "RTX 4060Ti Windforce OC 8G",
      productImage: "https://cdn1.ozone.ru/s3/multimedia-e/6660780194.jpg",
      productName: "RTX 4060Ti Windforce OC 8G",
      productPrice: 41540,
      productAbout: "Видеокарта Gigabyte RTX4060 WINDFORCE OC 8GB GDDR6 128-bit DPx2 HDMIx2 2FAN RTL Прогрессивная микроархитектура Ada Lovelace, фирменная технология NVIDIA DLSS 3 и полноценная реализация трасировки лучей Тензорные ядра 4-поколения: прирост производительности с DLSS 3 до 4x (по сравнению с типовой процедурой рендеринга сцены) RT-ядра 3-поколения: 2-кратный прирост производительности на операциях трассировки лучей Графический процессор GeForce RTX 4060 ВидеоОЗУ GDDR6 8 Гбайт, 128-разрядная шина памяти Система охлаждения WINDFORCE Защитная пластина на тыльной стороне печатной платы.",
      productSpecifications: "1",
  ),
  Product(productId: 2,
      productTitle: "RTX 4070 EAGLE OC 12G",
      productImage: "https://cdn1.ozone.ru/s3/multimedia-1-f/7036023075.jpg",
      productName: "RTX 4070 EAGLE OC 12G",
      productPrice: 84480,
      productAbout: "Видеокарта GIGABYTE GeForce RTX 4070 Ti EAGLE OC 12GB - это продукт от известного производителя GIGABYTE, который зарекомендовал себя на рынке компьютерной техники. Видеокарта оснащена видеопроцессором NVIDIA GeForce RTX 4070 Ti, который обеспечивает высокую производительность и реалистичное изображение. Техпроцесс составляет 4 нм, что гарантирует высокую скорость обработки данных и низкое энергопотребление. Объем видеопамяти составляет 12 ГБ, что позволяет работать с тяжелыми графическими приложениями и играми. Тип памяти GDDR6X обеспечивает высокую скорость передачи данных и стабильность работы.",
      productSpecifications: "1",
  ),
  Product(productId: 3,
      productTitle: "RTX 4090 Windforce 24G",
      productImage: "https://avatars.mds.yandex.net/get-mpic/10229228/2a00000190e682a74ff9549f8bf50a7612b6/orig",
      productName: "RTX 4090 Windforce 24G",
      productPrice: 304920,
      productAbout: "Видеокарта GIGABYTE GeForce RTX 4090 WINDFORCE V2 [GV-N4090WF3V2-24GD] на основе архитектуры NVIDIA Ada Lovelace обеспечивает высокую графическую производительность для работы с программами и запуска игр на ПК. Процессор функционирует с частотой 2230 МГц, которая способна повышаться до значения 2520 МГц в режиме разгона. Видеокарта оснащена 24 ГБ памяти стандарта GDDR6X с пропускной способностью 1008 Гбайт/сек, что обеспечивает быстродействие обработки графических данных.",
      productSpecifications: "1",
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToAddProductPage(BuildContext context) async {
    final Product result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => const AddProductPage()),
    );

    if (result != null) {
      setState(() {
        products.add(result);
      });
    }
  }

  void removeProduct(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.amberAccent,
          title: const Text('Подтверждение удаления'),
          content: const Text('Вы уверены, что хотите удалить этот товар?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Удалить',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("ILYA MARKET",
          style: TextStyle(fontWeight: FontWeight.bold,
            letterSpacing: 6,
            fontSize: 30,
          ),
        )
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 0.76,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(product: products[index], index: index, removeProduct: removeProduct);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () => navigateToAddProductPage(context),
        child: const Icon(Icons.add_box_rounded),
        tooltip: "Добавить товар",
      ),
    );
  }
}