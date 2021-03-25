import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snow_man_labs_challenge_unoffi/app/controller/question_controller.dart';
import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/widgets/custom_card.dart';
//Color(0xff10159A)

class HomePage extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  final QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    // deixar transparente cor
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perguntas Frequentes',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xff10159A),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: GetX<QuestionController>(builder: (_) {
          return _.questionList != null
              ? CustomCard(
                  //if
                  question: _.question,
                )
              : Center(
                  //else
                  child: CircularProgressIndicator(),
                );
        }),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffFFBE00),
            elevation: 0,
            padding: EdgeInsets.all(10),

          ),
          onPressed: () {},
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Adicionar Pergunta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xffFFBE00),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.add,
                size: 28,
                color: Color(0xff10159A),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
