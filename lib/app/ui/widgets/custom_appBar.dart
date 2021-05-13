import 'package:flutter/material.dart';

//TODO Text("Perguntas Frequentes") IN APPBAR

class CustomAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff10159A),
        title: Container(
          padding: EdgeInsets.only(top: 5),
          child: TextFormField(
            autofocus: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Procurar Pergunta",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
                ),
              suffixIcon: IconButton(
                icon: Row(
                  children: [
                    Icon(Icons.clear),
                  ],
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
