import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/model/question_Model.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/repository/question_repository.dart';

class QuestionController extends GetxController {
  Rx<List<QuestionModel>> questionList = Rx<List<QuestionModel>>();
  Rx<List<QuestionModel>> questionSearchList = Rx<List<QuestionModel>>();
  TextEditingController searchController = TextEditingController();
  RxBool _isSearching = false.obs;

  get isSearching => this._isSearching.value;

  set isSearching(value) => this._isSearching.value = value;

  List<QuestionModel> get question => questionList.value;

  List<QuestionModel> get questionSList => questionSearchList.value;


  getAll() {
    questionList.bindStream(QuestionRepository().getAll());
  }

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  activeBarSearch() {
    isSearching = !isSearching;
    searchController.addListener(onSearchChanged);
  }

  search(value) {
    questionSearchList.value = questionList.value
        .where((q) => (q.title
                .toLowerCase()
                .contains(value.toString().toLowerCase()) ||
            q.anwser.toLowerCase().contains(value.toString().toLowerCase())))
        .toList();
    return questionSearchList.value;
  }

  onSearchChanged() {
    print("Texto pesquisa ${searchController.text}");
    // print(questionSearchList.value[0].title);
  }
}
