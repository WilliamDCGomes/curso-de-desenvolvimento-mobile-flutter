import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  String resu = "Escolha uma opção abaixo";
  int maquina = -1;
  _maquinaEscolhe(){
    maquina = Random().nextInt(3);
    if(maquina == 0)
      setState(() {this._imagemApp = AssetImage("images/pedra.png"); });
    else if(maquina == 1)
      setState(() {this._imagemApp = AssetImage("images/papel.png"); });
    else if(maquina == 2)
      setState(() {this._imagemApp = AssetImage("images/tesoura.png"); });
  }
  _opcaoSelecionada(int op){
    if(op == maquina)
      setState(() {resu = "Empate!!!"; });
    else if(op == 0 && maquina == 1)
      setState(() {resu = "Você perdeu!!!"; });
    else if(op == 0 && maquina == 2)
      setState(() {resu = "Você venceu!!!"; });
    else if(op == 1 && maquina == 0)
      setState(() {resu = "Você venceu!!!"; });
    else if(op == 1 && maquina == 2)
      setState(() {resu = "Você perdeu!!!"; });
    else if(op == 2 && maquina == 0)
      setState(() {resu = "Você perdeu!!!"; });
    else if(op == 2 && maquina == 1)
      setState(() {resu = "Você venceu!!!"; });
  }

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
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              resu,
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
              GestureDetector(
                onTap: (){
                  _maquinaEscolhe();
                  _opcaoSelecionada(0);
                },
                child: Image.asset('images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: (){
                  _maquinaEscolhe();
                  _opcaoSelecionada(1);
                },
                child: Image.asset('images/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: (){
                  _maquinaEscolhe();
                  _opcaoSelecionada(2);
                },
                child: Image.asset('images/tesoura.png', height: 100),
              ),
            ],
          )
        ],
      )
    );
  }
}
