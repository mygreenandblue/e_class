// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edu_connection/core/models/message_notify.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class FirestoreConstants {
//   static const pathUserCollection = "users";
//   static const pathMessageCollection = "messages";
//   static const displayName = "displayName";
//   static const aboutMe = "aboutMe";
//   static const photoUrl = "photoUrl";
//   static const id = "id";
//   static const chattingWith = "chattingWith";
//   static const idFrom = "idFrom";
//   static const idTo = "idTo";
//   static const timestamp = "timestamp";
//   static const createdAt = "createdAt";
//   static const content = "content";
//   static const type = "type";
// }

// class ChatProvider {
//   final FirebaseFirestore firebaseFirestore;
//   final FirebaseStorage firebaseStorage;

//   ChatProvider(
//       {required this.firebaseFirestore, required this.firebaseStorage});

//   UploadTask uploadFile(File image, String fileName) {
//     Reference reference = firebaseStorage.ref().child(fileName);
//     UploadTask uploadTask = reference.putFile(image);
//     return uploadTask;
//   }

//   Future<void> updateDataFirestore(String collectionPath, String docPath,
//       Map<String, dynamic> dataNeedUpdate) {
//     return firebaseFirestore
//         .collection(collectionPath)
//         .doc(docPath)
//         .update(dataNeedUpdate);
//   }

//   Stream<QuerySnapshot> getChatStream(String groupChatId, int limit) {
//     return firebaseFirestore
//         .collection(FirestoreConstants.pathMessageCollection)
//         .doc(groupChatId)
//         .collection(groupChatId)
//         .orderBy(FirestoreConstants.timestamp, descending: true)
//         .limit(limit)
//         .snapshots();
//   }

//   void sendMessage(
//       String content, String groupChatId, String currentUserId, String peerId) {
//     final documentReference = firebaseFirestore
//         .collection(FirestoreConstants.pathMessageCollection)
//         .doc(groupChatId)
//         .collection(groupChatId)
//         .doc(DateTime.now().millisecondsSinceEpoch.toString());

//     final messageChat = ChatMessage(
//       senderId: currentUserId,
//       peerId: peerId,
//       timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
//       text: content,
//     );

//     FirebaseFirestore.instance.runTransaction((transaction) async {
//       transaction.set(
//         documentReference,
//         messageChat.toJson(),
//       );
//     });
//   }
// }
