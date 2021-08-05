import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var controllerLogin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset("images/logo.png"),
              ),
              TextFormField(
                controller: controllerLogin,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  hintStyle: TextStyle(
                    fontSize: 2.h,
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 2.h,
                ),
              ),
              TextFormField(
                controller: controllerLogin,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Senha",
                  hintStyle: TextStyle(
                    fontSize: 2.h,
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 2.h,
                ),
              ),
              RaisedButton(
                onPressed: (){

                },
                color: Colors.green,
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Não tem conta? cadastre-se!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
