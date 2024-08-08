// import 'package:edu_connection/core/service/auth_service.dart';
// import 'package:edu_connection/core/service/crud_service.dart';
// import 'package:edu_connection/main.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class PushNotifications {
//   static final _firebaseMessaging = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   static Future init() async {
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: true,
//       provisional: false,
//       sound: true,
//     );
//   }

//   static Future getDeviceToken() async {
//     final token = await _firebaseMessaging.getToken();
//     print("device token: $token");

//     bool isUserLoggedin = await AuthService.isLoggedIn();
//     if (isUserLoggedin) {
//       await CrudService.saveToken(token!);
//       print('save');
//     }

//     _firebaseMessaging.onTokenRefresh.listen((event) async {
//       if (isUserLoggedin) {
//         await CrudService.saveToken(token!);
//         print('save');
//       }
//     });
//   }

//   static Future localNotiInit() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) => null,
//     );
//     final LinuxInitializationSettings initializationSettingsLinux =
//         LinuxInitializationSettings(defaultActionName: 'Open notification');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux);

//     _flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()!
//         .requestNotificationsPermission();

//     _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onNotificationTap,
//         onDidReceiveBackgroundNotificationResponse: onNotificationTap);
//   }

//   static void onNotificationTap(NotificationResponse notificationResponse) {
//     navigatorKey.currentState!
//         .pushNamed('/chatpage', arguments: notificationResponse);
//   }

//   static Future showSimpleNotification({
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('channelId', 'channelName',
//             channelDescription: 'channelDescription',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');

//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await _flutterLocalNotificationsPlugin
//         .show(0, title, body, notificationDetails, payload: payload);
//   }
// }
