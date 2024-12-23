import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:full_proj_pks/models/message.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String senderId, String receiverId, String text) async {
    final chatId = _getChatId(senderId, receiverId);
    print('Sending message to chat: $chatId');

    // Проверяем, существует ли уже чат
    final chatDoc = _firestore.collection('chats').doc(chatId);
    final chatExists = await chatDoc.get().then((doc) => doc.exists);

    if (!chatExists) {
      print('Creating new chat: $chatId');
      await chatDoc.set({
        'participants': [senderId, receiverId], // Создаем поле participants
      });
    }

    // Добавляем сообщение в коллекцию messages
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: senderId,
      receiverId: receiverId, // Добавляем receiverId
      text: text,
      timestamp: DateTime.now(),
    );

    print('Adding message: ${message.toJson()}');
    await chatDoc.collection('messages').add(message.toJson());
  }

  // Получение чата между двумя пользователями
  Stream<List<Message>> getChatMessages(String senderId, String receiverId) {
    final chatId = _getChatId(senderId, receiverId);

    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList();
    });
  }

  // Получение списка чатов для продавца
  Stream<List<Map<String, dynamic>>> getSellerChats(String sellerId) {
    return _firestore
        .collection('chats')
        .where('participants', arrayContains: sellerId) // Фильтруем по полю participants
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  // Генерация уникального ID для чата между двумя пользователями
  String _getChatId(String senderId, String receiverId) {
    return senderId.hashCode <= receiverId.hashCode
        ? '$senderId-$receiverId'
        : '$receiverId-$senderId';
  }
}