import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text.trim().replaceAll(',', '.'));
    double precoGasolina = double.tryParse(_controllerGasolina.text.trim().replaceAll(',', '.'));
    if(precoAlcool != null && precoGasolina != null){
      if( precoAlcool / precoGasolina >= 0.7)
        setState(() {
          _textoResultado = "É melhor abastecer com gasolina!";
        });
      else
        setState(() {
          _textoResultado = "É melhor abastecer com Alcool!";
        });
    }
    else
      setState(() {
        _textoResultado = "Informações inválidas";
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alcool ou Gasolina"),
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
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
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "Preço Alcool ex 1.59")),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextField(
                          controller: _controllerGasolina,
                          textInputAction: TextInputAction.go,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: "Preço Gasolina ex 3.15")),
                    ),
                    RaisedButton(
                      onPressed: _calcular,
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
                        _textoResultado,
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
