import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/routes/app_pages.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/theme/app_theme.dart';
import 'app/binding/question_binding.dart';
import 'app/ui/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: QuestionBinding(),
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      theme: AppTheme,
      home: HomePage(),
    ),
  );
}
