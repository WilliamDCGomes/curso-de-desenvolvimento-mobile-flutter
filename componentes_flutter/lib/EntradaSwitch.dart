import 'package:flutter/material.dart';
class SwitchText extends StatefulWidget {
  const SwitchText({Key key}) : super(key: key);

  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<SwitchText> {
  bool changeValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text("Receber notificações?"),
              value: changeValue,
              onChanged: (bool valor){
                setState(() {
                  changeValue = valor;
                });
              }
            ),
            Switch(
              value: changeValue,
              onChanged: (bool valor){
                setState(() {
                  changeValue = valor;
                });
              }
            ),
            Text("Receber notificações?")
          ],
        ),
      ),
    );
  }
}
