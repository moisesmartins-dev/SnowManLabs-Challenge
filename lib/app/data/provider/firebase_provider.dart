import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/model/question_Model.dart';
import 'package:intl/intl.dart';

class FirebaseProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<QuestionModel>> getAllQuestions() {
    try {
      return _firestore
          .collection('question')
          .orderBy('createdAt', descending: false)
          .snapshots()
          .map((query) {
        // ignore: deprecated_member_use
        List<QuestionModel> retVal = List();
        query.docs.forEach((element) {
          retVal.add(QuestionModel.fromDocumentsSnapshot(element));
        });
        return retVal;
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // ignore: missing_return
  Stream<List<QuestionModel>> getAllSearch(String queryString)  {
      try {
      _firestore
          .collection('question').where('title', isEqualTo: queryString)
          .orderBy('createdAt', descending: false)
          .snapshots();

    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future addQuestion(
      String title, String anwser, String color, String timeStamp) async {
    try {
      await _firestore.collection('question').add({
        'title': title,
        'anwser': anwser,
        'color': color,
        'createdAt': timeStamp,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
