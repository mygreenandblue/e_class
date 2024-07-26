// import 'dart:async';

// import 'package:edu_connection/feature/login/cubit/auth_cubit.dart';
// import 'package:edu_connection/routing/app_routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthCubit, AuthState>(
//       listener: (context, state) {
//         if (state is Authenticated) {
//           context.go(Route.homePath);
//         } else if (state is UnAuthenticated) {
//           context.go(Route.loginPath);
//         } else {
//           context.go(Route.loginPath);
//         }
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/logos/logo.png',
//                 height: 150,
//                 width: 150,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'CREATIVE READER\'S',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.teal,
//                 ),
//               ),
//               const Text(
//                 'PUBLICATION',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.teal,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
