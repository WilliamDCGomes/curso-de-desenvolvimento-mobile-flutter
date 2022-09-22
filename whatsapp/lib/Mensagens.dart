import 'package:flutter/material.dart';

import 'models/Usuario.dart';

class Mensagens extends StatefulWidget {
  late Usuario contato;
  Mensagens({
    Key? key,
    required this.contato
  }) : super(key: key);

  @override
  State<Mensagens> createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Color(0XFF096A63),
        title: Text(
          widget.contato.nome,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
