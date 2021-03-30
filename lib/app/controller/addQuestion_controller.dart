import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/repository/question_repository.dart';

class AddQuestionController extends GetxController {

  final TextEditingController questionTxtEditController = TextEditingController();
  final TextEditingController answerTxtEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxString _selectedColor = "".obs;
  get selectedColor => this._selectedColor.value;
  set selectedColor(value) => this._selectedColor.value = value;

  selectedColorChange(value) {
    this.selectedColor = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();

  }
  @override
  void dispose() {
    questionTxtEditController.dispose();
    answerTxtEditController.dispose();
    super.dispose();
  }

  void add() {
    DateTime now = DateTime.now();
    String timeStamp = DateFormat('yyyy-MM-dd - kk:mm:ss').format(now);
    QuestionRepository().add(
        title: questionTxtEditController.text,
        anwser: answerTxtEditController.text,
        createdAt: timeStamp,
        color: _selectedColor.toString()
    );
  }
}