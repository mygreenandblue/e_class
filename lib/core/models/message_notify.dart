// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edu_connection/feature/chat/view/chat_provider.dart';

// class ChatMessage {
//   final String senderId;
//   final String text;
//   final String timestamp;
//   final String peerId;

//   ChatMessage(
//       {required this.senderId,
//       required this.text,
//       required this.timestamp,
//       required this.peerId});

//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//         senderId: json['senderId'],
//         text: json['text'],
//         timestamp: json['timestamp'],
//         peerId: json['peerId']);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'senderId': senderId,
//       'text': text,
//       'timestamp': timestamp,
//       'peerId': peerId,
//     };
//   }

//   factory ChatMessage.fromDocument(DocumentSnapshot doc) {
//     String idFrom = doc.get(FirestoreConstants.idFrom);
//     String idTo = doc.get(FirestoreConstants.idTo);
//     String timestamp = doc.get(FirestoreConstants.timestamp);
//     String content = doc.get(FirestoreConstants.content);

//     return ChatMessage(
//       senderId: idFrom,
//       peerId: idTo,
//       timestamp: timestamp,
//       text: content,
//     );
//   }
// }

// class UserChat {
//   final String id;

//   final String displayName;

//   const UserChat({
//     required this.id,
//     required this.displayName,
//   });

//   Map<String, String> toJson() {
//     return {
//       FirestoreConstants.displayName: displayName,
//     };
//   }

//   factory UserChat.fromDocument(DocumentSnapshot doc) {
//     String displayName = "";

//     try {
//       displayName = doc.get(FirestoreConstants.displayName);
//     } catch (_) {}
//     return UserChat(
//       id: doc.id,
//       displayName: displayName,
//     );
//   }
// }
