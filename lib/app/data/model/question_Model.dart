import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String title;
  String anwser;
  String color;

  QuestionModel({this.title, this.anwser, this.color});

  QuestionModel.fromDocumentsSnapshot(DocumentSnapshot doc) {
    title = doc.data()['title'];
    anwser = doc.data()['anwser'];
    color = doc.data()['color'];
  }
}
