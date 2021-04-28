import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "JokenPo"
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(
            'images/padrao.png',
            height: 150,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Você perdeu :(",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/pedra.png',
                height: 100,
              ),
              Image.asset(
                'images/papel.png',
                height: 100,
              ),
              Image.asset(
                'images/tesoura.png',
                height: 100,
              ),
            ],
          )
        ],
      )
    );
  }
}
