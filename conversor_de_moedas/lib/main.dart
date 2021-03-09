import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:async";
import "dart:convert";

const request = "https://api.hgbrasil.com/finance?format=json&key=dd81bc40";
void main() async {
  
  runApp(MaterialApp(
    home: Container()
  ));
}
Future<Map> getData() async{
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$",),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: ,
    );
  }
}
