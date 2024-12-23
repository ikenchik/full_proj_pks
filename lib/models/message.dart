class Message {
  final String id;
  final String senderId;
  final String receiverId; // Добавляем поле для получателя
  final String text;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId, // Добавляем в конструктор
    required this.text,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'], // Добавляем в фабрику
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId, // Добавляем в JSON
      'text': text,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}