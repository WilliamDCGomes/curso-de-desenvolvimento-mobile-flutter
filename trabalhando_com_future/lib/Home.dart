import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }
  Widget GetFuture(){
    return FutureBuilder<Map>(
      future: _recuperarPreco(),
      builder: (context, snapshot){
        String resultado;
        switch(snapshot.connectionState){
          case ConnectionState.none:
            resultado = "Sem conexão";
            break;
          case ConnectionState.waiting:
            resultado = "Aguardando";
            break;
          case ConnectionState.active:
            resultado = "Mantem ativo enquanto recebe dados";
            break;
          case ConnectionState.done:
            if(snapshot.hasError)
              resultado = "Erro ao carregar os dados";
            else {
              double valorRecuperado = snapshot.data["BRL"]["buy"];
              resultado = "Fim do recebimento de dados\nValor recuperado: R\$ ${valorRecuperado}";
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trabalhando com Future e FutureBuilder"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GetFuture(),
            ],
          ),
        ),
      )
    );
  }
}
