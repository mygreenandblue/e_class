// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/scheduler.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_core/firebase_core.dart';

// class ChatPage extends StatefulWidget {
//   final String selectedUserId;
//   final String selectedUserName;

//   ChatPage({required this.selectedUserId, required this.selectedUserName});

//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final TextEditingController _messageController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final ScrollController _scrollController = ScrollController();
//   final ImagePicker _picker = ImagePicker();
//   late User currentUser;

//   @override
//   void initState() {
//     currentUser = _auth.currentUser!;
//     super.initState();
//   }

//   void _scrollToBottom() {
//     if (_scrollController.hasClients) {
//       _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     }
//   }

//   Future<void> _sendMessage(String messageText, String? imageUrl) async {
//     final messageSender = currentUser.email;
//     _messageController.clear();
//     if (messageText.isNotEmpty || imageUrl != null) {
//       await _firestore.collection('messages').add({
//         'text': messageText,
//         'imageUrl': imageUrl,
//         'sender': messageSender,
//         'timestamp': FieldValue.serverTimestamp(),
//         'users': [currentUser.uid, widget.selectedUserId],
//       });
//       if (currentUser.uid != widget.selectedUserId) {
//         await sendNotification(messageText);
//       }
//       _scrollToBottom();
//     }
//   }

//   Future<void> _pickImage() async {
//     try {
//       final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         final file = File(pickedFile.path);
//         if (await file.exists()) {
//           print('File exists: ${file.path}');
//           _uploadFile(file);
//         } else {
//           print('File does not exist at path: ${file.path}');
//         }
//       } else {
//         print('No image selected.');
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }

//   Future<void> _uploadFile(File file) async {
// // Create the file metadata
//     final metadata = SettableMetadata(contentType: "image/jpeg");

// // Create a reference to the Firebase Storage bucket
//     final storageRef = FirebaseStorage.instance.ref();

// // Upload file and metadata to the path 'images/mountains.jpg'
//     final uploadTask = storageRef
//         .child("images/path/to/mountains.jpg")
//         .putFile(file, metadata);

// // Listen for state changes, errors, and completion of the upload.
//     uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
//       switch (taskSnapshot.state) {
//         case TaskState.running:
//           final progress =
//               100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
//           print("Upload is $progress% complete.");
//           break;
//         case TaskState.paused:
//           print("Upload is paused.");
//           break;
//         case TaskState.canceled:
//           print("Upload was canceled");
//           break;
//         case TaskState.error:
//           // Handle unsuccessful uploads
//           break;
//         case TaskState.success:
//           // Handle successful uploads on complete
//           // ...
//           break;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.selectedUserName}'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore
//                   .collection('messages')
//                   .where('users', arrayContains: widget.selectedUserId)
//                   .orderBy('timestamp')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.hasError) {
//                   return const Center(
//                     child: Text('Error loading messages'),
//                   );
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return const Center(
//                     child: Text('No messages yet'),
//                   );
//                 }
//                 final messages = snapshot.data!.docs.where((message) {
//                   final users = List.from(message['users']);
//                   if (users.last == currentUser.uid &&
//                       users.first == widget.selectedUserId) {
//                     return users.contains(currentUser.uid);
//                   } else if (users.last == widget.selectedUserId &&
//                       users.first == currentUser.uid) {
//                     return users.contains(widget.selectedUserId);
//                   } else {
//                     return false;
//                   }
//                 }).toList();

//                 SchedulerBinding.instance.addPostFrameCallback((_) {
//                   _scrollToBottom();
//                 });

//                 return ListView(
//                   controller: _scrollController,
//                   children: messages.map((message) {
//                     final messageText = message['text'];
//                     final messageSender = message['sender'];
//                     final isMe = messageSender == currentUser.email;
//                     final imageUrl = message['imageUrl'];

//                     return Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 14),
//                       alignment:
//                           isMe ? Alignment.centerRight : Alignment.centerLeft,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 14),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: isMe ? Colors.blue[200] : Colors.grey[200],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: isMe
//                               ? CrossAxisAlignment.end
//                               : CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               messageSender,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: isMe ? Colors.white : Colors.black,
//                               ),
//                             ),
//                             if (imageUrl != null)
//                               Image.network(imageUrl, height: 150),
//                             if (messageText.isNotEmpty)
//                               Text(
//                                 messageText,
//                                 style: TextStyle(
//                                   color: isMe ? Colors.white : Colors.black,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () async {
//                     final messageText = _messageController.text;
//                     _sendMessage(messageText, null);
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.image),
//                   onPressed: _pickImage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> sendNotification(String message) async {
//     final token = await _firestore
//         .collection('user_data')
//         .doc(widget.selectedUserId)
//         .get()
//         .then((documentSnapshot) {
//       if (documentSnapshot.exists) {
//         return documentSnapshot.data()?['token'];
//       } else {
//         return null;
//       }
//     });
//     try {
//       final url = Uri.parse('http://10.0.2.2:3000/send-notification');
//       final body = jsonEncode({
//         'token': token,
//         'message': message,
//         'senderId': currentUser.uid,
//         'senderName': currentUser.email,
//       });

//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: body,
//       );

//       if (response.statusCode == 200) {
//         print('Notification sent successfully');
//       } else {
//         print('Failed to send notification: ${response.body}');
//       }
//     } catch (e) {
//       print('Error sending notification: $e');
//     }
//   }
// }
