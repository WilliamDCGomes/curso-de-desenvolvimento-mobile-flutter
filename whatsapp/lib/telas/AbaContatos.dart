import 'package:flutter/material.dart';

class AbaContatos extends StatefulWidget {
  const AbaContatos({Key? key}) : super(key: key);

  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Contatos",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
