import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snow_man_labs_challenge_unoffi/app/controller/home_controller.dart';
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
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff0C107C),
            statusBarIconBrightness: Brightness.light),
        title: GetX<QuestionController>(
          builder: (_) {
            return _questionController.isSearching == true
                ? Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff0F137A),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      controller: _questionController.searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Pesquisar perguntas",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        suffix: Text("|"),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        suffixStyle:
                            TextStyle(fontSize: 16, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            _questionController.searchController.clear();
                            _questionController.activeBarSearch();
                            _questionController.getAll();
                          },
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Text("Pergunta Frequentes");
          },
        ),
        centerTitle: true,
        actions: [
          GetX<QuestionController>(
            builder: (_) {
              return _.isSearching == false
                  ? IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _questionController.activeBarSearch();
                      })
                  : Visibility(
                      child: Text('.'),
                      visible: false,
                      maintainSize: false,
                    );
            },
          )
        ],
        backgroundColor: Color(0xff10159A),
      ),
      body: Container(
        // padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
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
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffFFBE00),
            elevation: 0,
            padding: EdgeInsets.all(10),
          ),
          onPressed: () {
            Get.toNamed('/addPergunta');
          },
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
