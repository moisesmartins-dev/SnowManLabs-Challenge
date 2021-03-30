import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/screens/addquestion_page.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/screens/home_page.dart';
import 'app_routes.dart';

class AppPages{
  static final routes =[
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.ADICIONAR_PERGUNTA, page: () => AddPerguntaPage()),
  ];
}