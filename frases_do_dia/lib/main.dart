import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text("Conteúdo principal"),
            FlatButton(
                onPressed: (){},
                child: Text("Teste")
            ),
            RaisedButton(
                onPressed: (){},
                child: Text("Teste"),
            ),
            FloatingActionButton(
                onPressed: (){},
                child: Text("+")
            )
          ],
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Text("Conteúdo principal"),
              Text("Conteúdo principal"),
            ],
          ),
        ),
      ),
    ),
  ));
}