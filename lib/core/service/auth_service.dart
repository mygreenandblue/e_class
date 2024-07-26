// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   static final FirebaseAuth _auth = FirebaseAuth.instance;

//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   static Future<String> signIn(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return 'Success';
//     } on FirebaseAuthException catch (e) {
//       return e.message.toString();
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   static Future<void> signOut() async {
//     await _auth.signOut();
//   }

//   static Future<bool> isLoggedIn() async {
//     var user = _auth.currentUser;
//     return user != null;
//   }

//   static Future<String> createAccount(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return 'Success';
//     } on FirebaseAuthException catch (e) {
//       return e.message.toString();
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
