import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// ===========================================================
// BACKGROUND MESSAGE HANDLER
// ===========================================================

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Firebase must be initialized in the background isolate
  await Firebase.initializeApp();

  print('==============================================');
  print('BACKGROUND MESSAGE');
  print('Message ID: ${message.messageId}');
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Data: ${message.data}');
  print('==============================================');
}

// ===========================================================
// FIREBASE MESSAGING SERVICE
// ===========================================================

class FirebaseMessagingService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  // =========================================================
  // INITIALIZE
  // =========================================================

  Future<void> initialize() async {
    // =======================================================
    // REQUEST NOTIFICATION PERMISSION
    // =======================================================

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );

    print('Notification permission: ${settings.authorizationStatus}');

    // =======================================================
    // GET FCM TOKEN
    // =======================================================

    String? token = await messaging.getToken();

    print('==============================================');
    print('FCM TOKEN');
    print(token);
    print('==============================================');

    // =======================================================
    // TOKEN REFRESH
    // =======================================================

    messaging.onTokenRefresh.listen((newToken) {
      print('==============================================');
      print('NEW FCM TOKEN');
      print(newToken);
      print('==============================================');
    });

    // =======================================================
    // FOREGROUND MESSAGE
    // =======================================================

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('==============================================');
      print('FOREGROUND MESSAGE');
      print('Message ID: ${message.messageId}');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
      print('Data: ${message.data}');
      print('==============================================');
    });

    // =======================================================
    // WHEN USER OPENS APP BY PRESSING NOTIFICATION
    // =======================================================

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('==============================================');
      print('NOTIFICATION OPENED');
      print('Message ID: ${message.messageId}');
      print('Data: ${message.data}');
      print('==============================================');
    });

    // =======================================================
    // WHEN APP WAS CLOSED AND OPENED BY NOTIFICATION
    // =======================================================

    RemoteMessage? initialMessage = await messaging.getInitialMessage();

    if (initialMessage != null) {
      print('==============================================');
      print('APP OPENED FROM NOTIFICATION');
      print('Message ID: ${initialMessage.messageId}');
      print('Data: ${initialMessage.data}');
      print('==============================================');
    }
  }
}
