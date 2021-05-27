import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _abrirEmpresa(){

  }
  void _abrirServico(){

  }
  void _abrirClientes(){

  }
  void _abrirContato(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ATM Consultoria",
          style: TextStyle(
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Image(
                  image: AssetImage("images/logo.png"),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: _abrirEmpresa,
                      child: Image.asset("images/menu_empresa.png"),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: _abrirServico,
                        child: Image.asset("images/menu_servico.png"),
                      )
                  ),
                ],
              )
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: _abrirClientes,
                        child: Image.asset("images/menu_cliente.png"),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: _abrirContato,
                        child: Image.asset("images/menu_contato.png"),
                      )
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
