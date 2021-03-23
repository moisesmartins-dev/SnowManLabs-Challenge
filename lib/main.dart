import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/routes/app_pages.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/android/home_page/home_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      home: HomePage(),
    ),
  );
}
