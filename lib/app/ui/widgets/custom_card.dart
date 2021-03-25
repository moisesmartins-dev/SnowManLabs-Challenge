import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
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
                offset: Offset(0,3),
                spreadRadius: 4,
                blurRadius: 10,
              ),
            ],
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
                          fontWeight: FontWeight.bold),),
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
      ),
    );
  }
}
