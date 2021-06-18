import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String savedText = "Nada salvo! ";
  TextEditingController text = TextEditingController();

  void _salvar(){

  }

  void _recuperar(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Manipulação de dados"
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                savedText,
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: text,
                decoration: InputDecoration(labelText: "Digite algo"),
                onChanged: (text){

                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: RaisedButton(
                        onPressed: _salvar,
                        color: Color(0xff2ca0f5),
                        child: Text(
                          "Salvar",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: _recuperar,
                      color: Color(0xff2ca0f5),
                      child: Text(
                        "Ler",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
