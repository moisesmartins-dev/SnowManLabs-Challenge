import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snow_man_labs_challenge_unoffi/app/data/model/question_Model.dart';

class CustomCard extends StatelessWidget {
  List<QuestionModel> question;

  CustomCard({this.question});

  @override
  Widget build(BuildContext context) {
    // TODO server para deixar transparente o divideColor do expansionTile
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return ListView.builder(
      padding: new EdgeInsets.fromLTRB(10, 20, 10, 70),
      shrinkWrap: true,
      itemCount: (question == null) ? 0 : question.length,
      itemBuilder: (_, index) {
        return Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: new BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(0, 3),
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              // TODO COLOR QUE MUDAR A COR LATERAL DO CARD, VEM DO FIREBASE
              color: Color(int.parse(question[index].color)),
            ),
            child: Padding(
              // TODO esse padding regula a lagura da cor lateral do card
              padding: const EdgeInsets.only(left: 2),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //TODO cor do card
                  color: Colors.white,
                ),
                child: Theme(
                  data: theme,
                  child: ExpansionTile(

                    childrenPadding: EdgeInsets.only(left: 5, bottom: 15),
                    title: Text(
                      question[index].title,
                      style: TextStyle(
                          color: Color(0xff10159A),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      CupertinoIcons.chevron_down,
                      color: Colors.grey,
                    ),
                    children: <Widget>[
                      Padding(
                        padding: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                question[index].anwser,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
