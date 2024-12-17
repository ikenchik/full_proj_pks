import 'package:flutter/material.dart';
import 'package:full_proj_pks/components/cart_product.dart';
import 'package:full_proj_pks/models/cart_manager.dart';
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

    // Расчет итоговой стоимости всех товаров в корзине
    double totalPrice = cartManager.cartProducts.fold(0, (sum, product) {
      return sum + (product.productPrice * product.quantity);
    });

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
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return CartProduct(product: cartManager.cartProducts[index]);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemCount: cartManager.cartProducts.length,
            ),
          ),
          // Отображение итоговой стоимости
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Итого:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${totalPrice.toStringAsFixed(2)}₽',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Кнопка "Купить"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  // Оформление заказа
                  await cartManager.checkout();

                  // Показ уведомления об успешном оформлении заказа
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Заказ успешно оформлен!'),
                    ),
                  );

                  // Переход на страницу заказов
                  Navigator.pushNamed(context, '/orders');
                } catch (e) {
                  // Показ ошибки, если что-то пошло не так
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ошибка: $e'),
                    ),
                  );
                }
              },
              child: const Text(
                'Купить',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}