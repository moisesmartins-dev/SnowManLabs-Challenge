import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/controller/question_controller.dart';

class QuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() => QuestionController());
  }
}
