import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.instance.collection("usuarios").document("pontuacao").setData({
    "William": "250",
    "Ana": "590"
  });
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

