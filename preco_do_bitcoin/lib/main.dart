import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valorConvertido = "0,00";
  void _convertMoney() async{
      Map<String, dynamic> result;
      http.Response response;
      response = await http.get("https://blockchain.info/ticker");
      result = json.decode(response.body);
      setState(() {
        _valorConvertido = result["BRL"]["buy"].toString();
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 30.0),
              child: Image.asset(
                "images/bitcoin.png",
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                    "R\$ " + _valorConvertido.replaceAll('.', ','),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0
                    ),
                ),
            ),
            SizedBox(
              width: 150.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.orange,
                onPressed: _convertMoney,
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
