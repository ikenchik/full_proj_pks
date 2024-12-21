import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:full_proj_pks/pages/chat_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SellerChatsPage extends StatelessWidget {
  const SellerChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чаты с покупателями'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Нет чатов'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final message = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                final senderId = message['senderId'];
                final text = message['text'];
                return ListTile(
                  title: Text('Отправитель: $senderId'),
                  subtitle: Text(text),
                );
              },
            );
          }
        },
      ),
    );
  }
}