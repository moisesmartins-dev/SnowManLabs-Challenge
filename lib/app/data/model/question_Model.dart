import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String title;
  String anwser;
  String color;
  String createdAt;

  QuestionModel({this.title, this.anwser, this.color,this.createdAt});

  QuestionModel.fromDocumentsSnapshot(DocumentSnapshot doc) {
    title = doc.data()['title'];
    anwser = doc.data()['anwser'];
    color = doc.data()['color'];
    createdAt= doc.data()['createdAt'];
  }
}
