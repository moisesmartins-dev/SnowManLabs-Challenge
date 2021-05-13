import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/repository/question_repository.dart';

class AddQuestionController extends GetxController {
  final TextEditingController questionTxtEditController =
      TextEditingController();
  final TextEditingController answerTxtEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _selectedColor = 0.obs;

  get selectedColor => this._selectedColor.value;

  set selectedColor(value) => this._selectedColor.value = value;

  final listColor = RxList();

  selectedColorChange(value) {
    this.selectedColor = value;
    update();
  }

  @override
  void onInit() {
    listColor.add(0xff46C9A7);
    listColor.add(0xffFF7074);
    listColor.add(0xffFFBE00);
    listColor.add(0xff10159A);
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
      color: listColor[_selectedColor.value].toString(),
    );
    // color: listColor[_selectedColor.value].toString().replaceAll('Color(', '').replaceAll(')', ''));
  }
}
