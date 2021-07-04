import 'package:flutter/material.dart';

class Bichos extends StatefulWidget {

  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        GestureDetector(
          onTap: (){

          },
          child: Image.asset("assets/images/cao.png"),
        ),
        GestureDetector(
          onTap: (){

          },
          child: Image.asset("assets/images/gato.png"),
        ),
        GestureDetector(
          onTap: (){

          },
          child: Image.asset("assets/images/leao.png"),
        ),
        GestureDetector(
          onTap: (){

          },
          child: Image.asset("assets/images/macaco.png"),
        ),
        GestureDetector(
          onTap: (){

          },
          child: Image.asset("assets/images/ovelha.png"),
        ),
        GestureDetector(
          onTap: (){

          },
          child: Image.asset("assets/images/vaca.png"),
        ),
      ],
    );
  }
}
