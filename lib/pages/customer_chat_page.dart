import 'package:flutter/material.dart';
import 'package:full_proj_pks/pages/chat_page.dart';

class CustomerChatPage extends StatelessWidget {
  const CustomerChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чат с продавцом'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(), // Замените на ID продавца
              ),
            );
          },
          child: const Text('Написать продавцу'),
        ),
      ),
    );
  }
}