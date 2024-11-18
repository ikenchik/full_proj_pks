import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/product.dart';
import 'package:full_proj_pks/models/cart_manager.dart';
import 'package:full_proj_pks/models/favorite_manager.dart';
import 'package:provider/provider.dart';

class ProductManager with ChangeNotifier{
  final List<Product> _products = <Product>[
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
    Product(productId: 4,
        productTitle: "Видеокарта Gigabyte Radeon RX 7600 GAMING OC 8G",
        productImage: "https://avatars.mds.yandex.net/get-mpic/11225627/2a0000018af87c2c8e082045cc24dd2cdac3/180x240",
        productName: "Видеокарта Gigabyte Radeon RX 7600 GAMING OC 8G",
        productPrice: 33227,
        productAbout: "Бренд: GIGABYTE Тип поставки: Ret Количество вентиляторов: 3 Цвет: черный Для геймеров: ДА PartNumber/Артикул Производителя: GV-R76GAMING OC-8GD Тип: Видеокарта Длина упаковки (ед): 0.41",
        productSpecifications: "Бренд: GIGABYTE Тип поставки: Ret Количество вентиляторов: 3 Цвет: черный Для геймеров: ДА PartNumber/Артикул Производителя: GV-R76GAMING OC-8GD Тип: Видеокарта Длина упаковки (ед): 0.41"
    ),
    Product(productId: 5,
        productTitle: "Видеокарта Acer RX7700XT NITRO OC 12GB GDDR6 192bit 3xDP HDMI 2FAN RTL",
        productImage: "https://avatars.mds.yandex.net/get-mpic/5245452/2a00000192b631bf90280871d2e4c4d9695b/74x100",
        productName: "Видеокарта Acer RX7700XT NITRO OC 12GB GDDR6 192bit 3xDP HDMI 2FAN RTL",
        productPrice: 47767,
        productAbout: "Эта видеокарта может обеспечить высокую производительность в современных играх и других графических приложениях. Она имеет достаточный объём видеопамяти и широкий интерфейс для подключения нескольких мониторов одновременно. Охлаждение с помощью двух вентиляторов обеспечивает стабильную работу при высоких нагрузках.",
        productSpecifications: "* **Графический процессор:** AMD Radeon RX 7700 XT. * **Объём видеопамяти:** 12 ГБ GDDR6. * **Ширина шины памяти:** 192 бита."
    )
  ];

  List<Product> get products => _products;


  void addToProducts(Product product){
    if (!_products.contains(product)){
      product.quantity++;
      _products.add(product);
      notifyListeners();
    }
  }

  void removeFromProducts(Product product, BuildContext context){
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
                _products.remove(product);
                notifyListeners();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool isInProducts(Product product){
    return _products.contains(product);
  }
}