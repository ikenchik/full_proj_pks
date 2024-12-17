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
        future: _apiService.getOrders(1), // Замените на реальный ID пользователя
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('У вас пока нет заказов'));
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