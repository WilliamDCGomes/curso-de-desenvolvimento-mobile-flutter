import 'package:flutter/material.dart';
class Checkboxs extends StatefulWidget {
  const Checkboxs({Key key}) : super(key: key);

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkboxs> {
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            /*
            Text(
              "Comida brasileira"
            ),
            Checkbox(
              value: test,
              onChanged: (bool valor){
                setState(() {
                  test = valor;
                });
              }
            )
            */
            CheckboxListTile(
                title: Text("Comida Brasileira"),
                value: test,
                onChanged: (bool value){
                  setState(() {
                    test = value;
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}
