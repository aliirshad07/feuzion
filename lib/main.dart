import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          child: GetMaterialApp(
            title: "Tapez Fusion",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            // home: LoginView(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    ),
  );
}
