import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/android/adicionar_pergunta/add_pergunta.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/android/home_page/home_page.dart';
import 'app_routes.dart';

class AppPages{
  static final routes =[
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.ADICIONAR_PERGUNTA, page: () => AddPerguntaPage()),
  ];
}