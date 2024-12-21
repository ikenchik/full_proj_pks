import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/cart_manager.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:badges/badges.dart' as badges;
import 'package:full_proj_pks/pages/customer_chat_page.dart';
import 'package:full_proj_pks/pages/fav_page.dart';
import 'package:full_proj_pks/pages/home_page.dart';
import 'package:full_proj_pks/pages/profile.dart';
import 'package:full_proj_pks/pages/shopping_cart.dart';
import 'package:full_proj_pks/pages/seller_chats_page.dart'; // Импортируем страницу для чатов продавца

class BNavBar extends StatefulWidget {
  const BNavBar({super.key});

  @override
  State<BNavBar> createState() => _BNavBarState();
}

class _BNavBarState extends State<BNavBar> {
  int _selectedIndex = 0;
  String? _userRole;

  Future<void> _fetchUserRole() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;

    try {
      // Получаем роль пользователя из таблицы users
      final response = await supabase
          .from('users')
          .select('role')
          .eq('id', userId)
          .maybeSingle();

      if (response != null) {
        // Проверяем, что виджет все еще находится в дереве перед вызовом setState
        if (mounted) {
          setState(() {
            _userRole = response['role']; // Сохраняем роль пользователя
          });
          print('Роль пользователя: $_userRole'); // Добавляем логирование
        }
      } else {
        print('Роль пользователя не найдена');
      }
    } catch (error) {
      print('Ошибка при получении роли пользователя: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartManager = Provider.of<CartManager>(context, listen: true);

    // Динамически создаем список страниц в зависимости от роли пользователя
    List<Widget> widgetOptions = [
      const HomePage(),
      const FavPage(),
      const ShoppingCart(),
      const Profile(),
    ];

    // Добавляем страницу чата в зависимости от роли
    if (_userRole == 'customer') {
      widgetOptions.add(const CustomerChatPage());
    } else if (_userRole == 'seller') {
      widgetOptions.add(const SellerChatsPage());
    }

    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Главная",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Избранное",
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeContent: Text(
                "${cartManager.cartProducts.length}",
              ),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.amberAccent,
              ),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            label: "Корзина",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Личный кабинет",
          ),
          if (_userRole == 'seller')
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: "Чаты",
            ),
          if (_userRole == 'customer')
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: "Чат с продавцом",
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 32, 100, 156),
        unselectedItemColor: const Color.fromARGB(100, 128, 128, 128),
        onTap: _onItemTapped,
      ),
    );
  }
}