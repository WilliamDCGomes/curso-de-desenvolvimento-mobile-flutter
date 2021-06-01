import 'package:flutter/material.dart';
class SecondScreen extends StatefulWidget {
  String imageResult;
  SecondScreen(this.imageResult);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(widget.imageResult, alignment: Alignment.center),
            Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset("images/botao_voltar.png", alignment: Alignment.center),
                )
            )
          ],
        ),
      ),
    );
  }
}
