import 'package:get/get.dart';
import 'file:///C:/Users/moisesmartins/AndroidStudioProjects/snow_man_labs_challenge_unoffi/lib/app/ui/screens/question_page.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/screens/home_page.dart';
import 'app_routes.dart';

class AppPages{
  static final routes =[
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.ADICIONAR_PERGUNTA, page: () => AddPerguntaPage()),
  ];
}