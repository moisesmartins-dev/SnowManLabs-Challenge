import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snow_man_labs_challenge_unoffi/app/controller/addQuestion_controller.dart';

class AddPerguntaPage extends StatelessWidget {
  final AddQuestionController _addQuestionController =
      Get.put(AddQuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        title: Text('Adicionar Pergunta'),
        backgroundColor: Color(0xff10159A),
      ),
      body: new InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _addQuestionController.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: TextFormField(
                          autofocus: true,
                          controller:
                              _addQuestionController.questionTxtEditController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Insira sua pergunta!';
                            }
                            return null;
                          },
                          maxLines: null,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            fillColor: Colors.grey,
                            labelText: 'Título da Pergunta',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: TextFormField(
                          maxLines: null,
                          controller:
                              _addQuestionController.answerTxtEditController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Insira sua resposta!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            fillColor: Colors.grey,
                            labelText: 'Resposta da Pergunta',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            child: Text(
                              'Cor',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        child: GetX<AddQuestionController>(
                          builder: (_) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _addQuestionController.listColor.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _addQuestionController
                                            .selectedColorChange(index);
                                        print(index);
                                      },
                                      child: GetX<AddQuestionController>(
                                        builder: (_) => Icon(
                                          Icons.done,
                                          color: index == _.selectedColor
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding:
                                            EdgeInsets.only(right: 20, left: 20),
                                        shape: CircleBorder(),
                                        elevation: 0,
                                        alignment: Alignment.center,
                                        minimumSize: Size(40, 40),
                                        side: BorderSide(color: Colors.white,width: 2),
                                        primary: Color(_addQuestionController
                                            .listColor[index]),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(4),
                                bottomLeft: Radius.circular(4),
                              ),
                            ),
                            primary: Color(0xffFFBE00),
                            elevation: 0.1,
                          ),
                          onPressed: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            if (_addQuestionController.formKey.currentState
                                .validate()) {
                              if (_addQuestionController.selectedColor
                                      .toString()
                                      .isEmpty ==
                                  true) {
                              } else {
                                _addQuestionController.add();
                                Get.back();
                                Get.snackbar(
                                  "",
                                  "",
                                  backgroundColor: Color(0xff46C9A7),
                                  maxWidth: double.infinity,
                                  duration: Duration(seconds: 2),
                                  margin: EdgeInsets.zero,
                                  titleText: Text(
                                    "Obrigado!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  messageText: Text(
                                    "Pergunta foi adicionada com sucesso.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  snackPosition: SnackPosition.BOTTOM,
                                  snackStyle: SnackStyle.GROUNDED,
                                  icon: Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                  ),
                                );
                              }
                            } else {}
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 17, bottom: 17),
                                child: Text(
                                  'Adicionar',
                                  style: TextStyle(
                                      color: Color(0xff10159A),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
