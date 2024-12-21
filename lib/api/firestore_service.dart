import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:full_proj_pks/models/message.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String senderId, String text) async {
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: senderId,
      text: text,
      timestamp: DateTime.now(),
    );

    await _firestore
        .collection('messages') // Общая коллекция для всех сообщений
        .add(message.toJson());
  }

  Stream<List<Message>> getMessages() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList();
    });
  }
}