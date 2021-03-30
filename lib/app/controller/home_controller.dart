import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/model/question_Model.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/repository/question_repository.dart';

class QuestionController extends GetxController {
  Rx<List<QuestionModel>> questionList = Rx<List<QuestionModel>>();
  Rx<List<QuestionModel>> questionSearchList = Rx<List<QuestionModel>>();
  TextEditingController searchController = TextEditingController();
  QuestionModel questionModel;
  RxBool _isSearching = false.obs;

  get isSearching => this._isSearching.value;
  set isSearching(value) => this._isSearching.value = value;

  List<QuestionModel> get question => questionList.value;

  getAll() {
    questionList.bindStream(QuestionRepository().getAll());
  }

  getAllSearch(String queryString) {
    questionSearchList.bindStream(QuestionRepository().getAllSearch(queryString: searchController.text));
  }

  activeBarSearch() {
    isSearching = !isSearching;
    searchController.addListener(onSearchChanged);
  }

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  onSearchChanged() {
    getAllSearch(searchController.text);
    print("Texto pesquisa ${searchController.text}");
  }
}
