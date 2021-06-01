import 'dart:math';

import 'package:flutter/material.dart';

import 'ResultCoin.dart';
void main(){
  runApp(
      MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void playCoin(){
    int result = Random().nextInt(2);
    String imageResult = result == 0 ? "images/moeda_cara.png" : "images/moeda_coroa.png";
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(imageResult)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png", alignment: Alignment.center),
            Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: GestureDetector(
                  onTap: playCoin,
                  child: Image.asset("images/botao_jogar.png", alignment: Alignment.center),
                )
            )
          ],
        ),
      ),
    );
  }
}
