import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:full_proj_pks/pages/chat_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:full_proj_pks/api/firestore_service.dart';

class SellerChatsPage extends StatelessWidget {
  const SellerChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sellerId = Supabase.instance.client.auth.currentUser!.id;
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Чаты с покупателями'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: firestoreService.getSellerChats(sellerId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Нет чатов'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final chat = snapshot.data![index];
                final customerId = chat['participants'].firstWhere((id) => id != sellerId);
                return ListTile(
                  title: Text('Чат с покупателем $customerId'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(receiverId: customerId), // Переход к чату с покупателем
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}