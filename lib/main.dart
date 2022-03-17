import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weellu_web/app/constants/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        authDomain: "chatflutter-24dc2.firebaseapp.com",
        apiKey: "AIzaSyAxp6lnbScS3WhrPkZII6EBZEMyEkQKs3c",
        appId: "1:629052155548:web:4128a2022f0b4abd812f59",
        messagingSenderId: "629052155548",
        projectId: "chatflutter-24dc2"),
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
    ),
  );
}
