// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class CrudService {
//   static Future saveToken(String token) async {
//     User? user = FirebaseAuth.instance.currentUser;
//     Map<String, dynamic> data = {
//       "email": user!.email,
//       "token": token,
//     };

//     try {
//       await FirebaseFirestore.instance
//           .collection("user_data")
//           .doc(user.uid)
//           .set(data);
//       print('added');
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
