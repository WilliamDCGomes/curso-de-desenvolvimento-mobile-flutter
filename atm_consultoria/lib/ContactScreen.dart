import 'package:flutter/material.dart';
class HomeContact extends StatefulWidget {
  const HomeContact({Key key}) : super(key: key);

  @override
  _HomeContactState createState() => _HomeContactState();
}

class _HomeContactState extends State<HomeContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Contato",
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
                    Image.asset("images/detalhe_contato.png"),
                    Text(
                      "Contato",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20.0
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                        "E-mail: consultoria@atm.com.br"
                    ),
                ),
                Divider(),
                Text(
                    "Telefone: (11) 3333-2222"
                ),
                Text(
                    "Celular: (11) 9999-8888"
                )
              ],
            ),
          ),
        )
    );
  }
}

 