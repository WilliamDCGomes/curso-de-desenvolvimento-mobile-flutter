import 'package:flutter/material.dart';

class AbaConversas extends StatefulWidget {
  const AbaConversas({Key? key}) : super(key: key);

  @override
  _AbaConversasState createState() => _AbaConversasState();
}

class _AbaConversasState extends State<AbaConversas> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Conversas",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
