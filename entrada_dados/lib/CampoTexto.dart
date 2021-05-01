import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alcool ou Gasolina"),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset("images/logo.png"),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                  ),
                  TextField(
                      controller: _controllerAlcool,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Preço Alcool ex 1.59")),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                        controller: _controllerGasolina,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "Preço Gasolina ex 3.15")),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Resultado",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ),
        )
    );
  }
}
