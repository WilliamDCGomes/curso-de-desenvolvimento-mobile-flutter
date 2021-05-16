import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String _escolhaUsuario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Radio Button Teste"
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Masculino"),
                  Radio(
                    value: "m",
                    groupValue: _escolhaUsuario,
                    onChanged: (String escolhaUsuario){
                      setState(() {
                        _escolhaUsuario = escolhaUsuario;
                      });
                      print("resultado: " + escolhaUsuario);
                    },
                  ),
                  Text("Feminino"),
                  Radio(
                    value: "f",
                    groupValue: _escolhaUsuario,
                    onChanged: (String escolhaUsuario){
                      setState(() {
                        _escolhaUsuario = escolhaUsuario;
                      });
                      print("resultado: " + escolhaUsuario);
                    },
                  ),
                ],
              ),
              RadioListTile(
                  title: Text("Masculino"),
                  value: "m",
                  groupValue: _escolhaUsuario,
                  onChanged: (String escolhaUsuario){
                    setState(() {
                      _escolhaUsuario = escolhaUsuario;
                    });
                  },
              ),
              RadioListTile(
                title: Text("Feminino"),
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (String escolhaUsuario){
                  setState(() {
                    _escolhaUsuario = escolhaUsuario;
                  });
                },
              ),
          ],
      ),
    ));
  }
}
