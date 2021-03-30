import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/model/question_Model.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/provider/firebase_provider.dart';

class QuestionRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<QuestionModel>> getAll() {
    return FirebaseProvider().getAllQuestions();
  }

  Stream<List<QuestionModel>> getAllSearch({String queryString}) {
    return FirebaseProvider().getAllSearch(queryString);
  }

  Future<void> add(
      {String title, String anwser, String color, String createdAt}) async {
    return FirebaseProvider().addQuestion(title, anwser, color, createdAt);
  }
}
