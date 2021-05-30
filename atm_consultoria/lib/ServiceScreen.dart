import 'package:flutter/material.dart';
class HomeService extends StatefulWidget {
  const HomeService({Key key}) : super(key: key);

  @override
  _HomeServiceState createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Serviços",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset("images/detalhe_servico.png"),
                    Text(
                      "Nossos Serviços",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0
                      ),
                    )
                  ],
                ),
                Divider(),
                Text("Consultoria"),

                Divider(),
                Text("Preços"),
                Text("Acompanhamento de Projetos")
              ],
            ),
          ),
        )
    );
  }
}

 