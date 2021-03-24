import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//Color(0xff10159A)

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // deixar transparente cor
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas Frequentes'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xff10159A),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    child: Theme(
                      data: theme,
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.only(left: 5, bottom: 15),
                        title: Text("Em qual data foi fundada a Snowman Labs?",
                            style: TextStyle(
                                color: Color(0xff10159A),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.arrow_drop_down),
                        children: <Widget>[
                          Padding(
                            padding: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "A Snowman Labs foi fundada no dia 9 de agosto de 2012.",
                                  style: TextStyle(color: Colors.grey[600]),
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
