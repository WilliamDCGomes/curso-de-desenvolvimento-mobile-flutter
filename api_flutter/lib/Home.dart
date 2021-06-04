import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Result.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController inputCep = TextEditingController();
  void _recuperarCep() async{
    String cep = inputCep.text;
    if(cep == null || cep?.trim() == ""){
      showDialog(
        context:  context,
        builder:  (BuildContext context) {
          return AlertDialog(
            title: Text("Caracteres digitados inválidos"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    print("sdhsihjiusushushusd d sdhds sdshids   " + cep);
    String url = "https://viacep.com.br/ws/${cep}/json/";
    http.Response response;
    response =  await http.get(url);
    print("status" + response.statusCode.toString());
    print(response.body);
    Map<String, dynamic> cepReturn = json.decode(response.body);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Result(cepReturn)
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consume de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Informe o cep"
              ),
              keyboardType: TextInputType.number,
              controller: inputCep,
            ),
            RaisedButton(
                onPressed: _recuperarCep,
                child: Text("Clique aqui"),
            )
          ],
        ),
      ),
    );
  }
}
