import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snow_man_labs_challenge_unoffi/app/ui/widgets/custom_card.dart';
//Color(0xff10159A)

class HomePage extends StatelessWidget {

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
      body: Column(
        children: [ListView.builder(
          itemCount: 5,
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index){
            return CustomCard();
          },

        ),
        ],),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Color(0xffFFBE00), borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(15),
        child: InkWell(
          onTap: () {
            print("okaaa");
          },
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Adicionar Pergunta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff10159A),
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
