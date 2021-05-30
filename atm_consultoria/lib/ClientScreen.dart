import 'package:flutter/material.dart';
class HomeClient extends StatefulWidget {
  const HomeClient({Key key}) : super(key: key);

  @override
  _HomeClientState createState() => _HomeClientState();
}

class _HomeClientState extends State<HomeClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Clientes",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset("images/detalhe_cliente.png"),
                    Text(
                      "Clientes",
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    )
                  ],
                ),
                Divider(),
                Image.asset("images/cliente1.png"),
                Text(
                  "Empresa de Software",
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
                Divider(),
                Image.asset("images/cliente2.png"),
                Text(
                  "Empresa de auditoria",
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

