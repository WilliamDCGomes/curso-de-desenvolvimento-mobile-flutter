import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Frases do dia",
    home: Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(
            width: 3,
            color: Colors.white
        )
      ),
      child: Column(
        children: <Widget>[
          Text("Texto")
        ],
      ),
    )
  ));
}