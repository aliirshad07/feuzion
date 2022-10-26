import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "TAPES Feuzion",
      initialRoute: "/",
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
