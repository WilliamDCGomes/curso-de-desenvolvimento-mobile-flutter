import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Color(0XFF096A63),
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
