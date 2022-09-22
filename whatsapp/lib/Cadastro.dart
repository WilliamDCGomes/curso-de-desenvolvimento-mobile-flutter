import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp/Home.dart';
import 'models/Usuario.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var controllerName = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  Color corMensagemErro = Colors.red;
  String mensagemErro = '';

  validarCampos(){
    if(controllerName.text.trim().isNotEmpty &&
        controllerEmail.text.trim().isNotEmpty &&
        controllerPassword.text.trim().isNotEmpty){
      setState(() {
        mensagemErro = "";
      });
      Usuario user = Usuario();
      user.nome = controllerName.text;
      user.email = controllerEmail.text;
      user.senha = controllerPassword.text;

      cadastrarUsuario(user);
    }
    else{
      setState(() {
        corMensagemErro = Colors.red;
        mensagemErro = "Preencha todos os campos";
      });
    }
  }

  cadastrarUsuario(Usuario user) async {
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.senha,
    ).then((value){
      print("Sucesso ao cadastrar");
      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("usuarios").doc(value.user!.uid).set(user.toMap());
      Get.offAll(Home());
    }).catchError((error){
      setState(() {
        corMensagemErro = Colors.red;
        mensagemErro = "Erro ao realizar o cadastro: \n" + error;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Color(0XFF015C4B),
        title: Text(
          "Cadastro",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(6.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_add,
                  color: Colors.white,
                  size: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Container(
                    height: 5.h,
                    padding: EdgeInsets.only(top: 0.5.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                      child: TextField(
                        controller: controllerName,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            hintText: "Nome",
                            hintStyle: TextStyle(
                              fontSize: 2.h,
                              color: Colors.white,
                            ),
                            enabledBorder: InputBorder.none
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 2.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Container(
                    height: 5.h,
                    padding: EdgeInsets.only(top: 0.5.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                      child: TextField(
                        controller: controllerEmail,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            hintText: "E-mail",
                            hintStyle: TextStyle(
                              fontSize: 2.h,
                              color: Colors.white,
                            ),
                            enabledBorder: InputBorder.none
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 2.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Container(
                    height: 5.h,
                    padding: EdgeInsets.only(top: 0.5.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                      child: TextField(
                        controller: controllerPassword,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            hintText: "Senha",
                            hintStyle: TextStyle(
                              fontSize: 2.h,
                              color: Colors.white,
                            ),
                            enabledBorder: InputBorder.none
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 2.h,
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: SizedBox(
                    height: 5.h,
                    child: ElevatedButton(
                      onPressed: (){
                        validarCampos();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                      ),
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Text(
                  mensagemErro,
                  style: TextStyle(
                    color: corMensagemErro,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
