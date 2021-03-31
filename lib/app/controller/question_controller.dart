import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/model/question_Model.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/provider/firebase_provider.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/repository/question_repository.dart';

class QuestionController extends GetxController {
  Rx<List<QuestionModel>> questionList = Rx<List<QuestionModel>>();
  QuestionModel questionModel;

  List<QuestionModel> get question => questionList.value;

  getAll() {
    questionList.bindStream(QuestionRepository().getAll());
  }

  @override
  void onInit() {
    getAll();
    super.onInit();
  }
}
