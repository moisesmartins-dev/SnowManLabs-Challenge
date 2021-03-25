import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/model/question_Model.dart';

class FirebaseProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<QuestionModel>> getAllQuestions() {
    try {
      return _firestore.collection('question').orderBy("", descending: false).snapshots().map((query) {
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

  Future addQuestion(String title, String anwser, String color, String id) async {
    try {
      await _firestore.collection('question').add({
        'id': id,
        'title': title,
        'anwser': anwser,
        'color': color,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
