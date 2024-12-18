import 'package:flutter/material.dart';
import 'package:full_proj_pks/api/api_service.dart';
import 'package:full_proj_pks/models/order.dart';

class OrdersPage extends StatelessWidget {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои заказы'),
      ),
      body: FutureBuilder<List<Order>>(
        future: _apiService.getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Если данных нет, показываем текст в середине страницы
            return Center(
              child: Text(
                'Вы еще не сделали ни одного заказа',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Если данных нет, показываем текст в середине страницы
            return Center(
              child: Text(
                'Вы еще не сделали ни одного заказа',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final order = snapshot.data![index];
                return ListTile(
                  title: Text('Заказ №${order.id}'),
                  subtitle: Text('Дата: ${order.orderDate}\nСумма: ${order.totalPrice}₽'),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      // Переход на страницу деталей заказа
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}