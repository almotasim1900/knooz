import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:koosh/bindings/intialbindings.dart';
import 'package:koosh/core/localizations/changelanguage.dart';
import 'package:koosh/core/localizations/translation.dart';
import 'package:koosh/routes.dart';
import 'package:koosh/services/firebase_messaging_service.dart';
import 'package:koosh/services/services.dart';

// ===========================================================
// MAIN
// ===========================================================

void main() async {
  // =========================================================
  // INITIALIZE FLUTTER
  // =========================================================

  WidgetsFlutterBinding.ensureInitialized();

  // =========================================================
  // FIREBASE
  // =========================================================

  await Firebase.initializeApp();

  // =========================================================
  // BACKGROUND FIREBASE MESSAGING
  // =========================================================

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // =========================================================
  // INITIAL SERVICES
  // =========================================================

  await initialServices();

  // =========================================================
  // FIREBASE MESSAGING SERVICE
  // =========================================================

  final FirebaseMessagingService firebaseMessagingService =
      FirebaseMessagingService();

  await firebaseMessagingService.initialize();

  // =========================================================
  // RUN APP
  // =========================================================

  runApp(const MyApp());
}

// ===========================================================
// MY APP
// ===========================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    // =======================================================
    // LANGUAGE CONTROLLER
    // =======================================================

    LanguageControllerPage controller = Get.put(LanguageControllerPage());

    // =======================================================
    // GET MATERIAL APP
    // =======================================================

    return GetMaterialApp(
      // =====================================================
      // TRANSLATIONS
      // =====================================================
      translations: MyTranslation(),

      // =====================================================
      // DEBUG BANNER
      // =====================================================
      debugShowCheckedModeBanner: false,

      // =====================================================
      // APP TITLE
      // =====================================================
      title: 'Flutter Demo',

      // =====================================================
      // LANGUAGE
      // =====================================================
      locale: controller.initlanguage,

      // =====================================================
      // THEME
      // =====================================================
      theme: controller.appTheme,

      // =====================================================
      // INITIAL BINDING
      // =====================================================
      initialBinding: Intialbindings(),

      // =====================================================
      // ROUTES
      // =====================================================
      getPages: routes,
    );
  }
}
