import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/model/question_Model.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/provider/firebase_provider.dart';
import 'package:snow_man_labs_challenge_unoffi/app/routes/app_pages.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/theme/app_theme.dart';
import 'app/binding/question_binding.dart';
import 'app/ui/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/ui/screens/question_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: QuestionBinding(),
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      theme: AppTheme,
      home: AddPerguntaPage(),
    ),
  );
}
