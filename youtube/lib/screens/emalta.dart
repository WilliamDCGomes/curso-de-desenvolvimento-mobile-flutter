import 'package:flutter/material.dart';

class EmAlta extends StatefulWidget {

  @override
  _EmAltaState createState() => _EmAltaState();
}

class _EmAltaState extends State<EmAlta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Em Alta",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25
          ),
        ),
      ),
    );
  }
}
