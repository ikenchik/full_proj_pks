import 'package:flutter/material.dart';
import 'package:full_proj_pks/models/message.dart';
import 'package:full_proj_pks/api/firestore_service.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatPage extends StatefulWidget {
  final String receiverId; // ID пользователя, с которым ведется чат

  const ChatPage({super.key, required this.receiverId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();
  late Stream<List<Message>> _messagesStream;

  @override
  void initState() {
    super.initState();
    final senderId = Supabase.instance.client.auth.currentUser!.id;
    _messagesStream = _firestoreService.getChatMessages(senderId, widget.receiverId);
  }

  @override
  Widget build(BuildContext context) {
    final senderId = Supabase.instance.client.auth.currentUser!.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Чат'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: _messagesStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Ошибка: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Нет сообщений'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final message = snapshot.data![index];
                      final isMe = message.senderId == senderId;
                      return ListTile(
                        title: Text(
                          message.text,
                          textAlign: isMe ? TextAlign.end : TextAlign.start,
                        ),
                        subtitle: Text(
                          message.timestamp.toString(),
                          textAlign: isMe ? TextAlign.end : TextAlign.start,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Введите сообщение',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    await _firestoreService.sendMessage(
                      senderId,
                      widget.receiverId, // Используем receiverId из параметров
                      _messageController.text,
                    );
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}