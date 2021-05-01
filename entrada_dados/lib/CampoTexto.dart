import 'package:flutter/material.dart';
class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Digite o valor"
              ),
            ),
          ),
        ],
      ),
    );
  }
}
