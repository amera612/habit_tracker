// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';

// class NotificationService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Initialization
//   Future<void> initializeNotification() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings(
//           'appicon',
//         ); // Ensure appicon.png exists in res/drawable

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: androidInitializationSettings);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: onNotificationResponse,
//     );
//   }

//   // Show a simple notification
//   Future<void> showNotification(String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//           'theme_channel', // Channel ID
//           'Theme Notifications', // Channel Name
//           channelDescription: 'Notification when theme changes',
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: 'ticker',
//         );

//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//     );

//     await flutterLocalNotificationsPlugin.show(
//       0, // Notification ID
//       title,
//       body,
//       notificationDetails,
//       payload: 'theme_changed',
//     );
//   }

//   // Handle notification tap (new API)
//   void onNotificationResponse(NotificationResponse response) {
//     final payload = response.payload;
//     if (payload != null) {
//       debugPrint('Notification payload: $payload');
//     }

//     Get.snackbar("Notification", "You tapped on the notification!");
//   }
// }
