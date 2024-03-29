import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Cadastro.dart';
import 'Home.dart';
import 'models/Usuario.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var controllerLogin = TextEditingController();
  var controllerPassword = TextEditingController();
  String mensagemErro = '';

  validarCampos(){
    if(controllerLogin.text.trim().isNotEmpty &&
        controllerPassword.text.trim().isNotEmpty){
      setState(() {
        mensagemErro = "";
      });
      Usuario user = Usuario();
      user.email = controllerLogin.text;
      user.senha = controllerPassword.text;

      _logarUsuario(user);
    }
    else{
      setState(() {
        mensagemErro = "Preencha todos os campos";
      });
    }
  }

  _logarUsuario(Usuario user) async {
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.senha,
    ).then((value){
      Get.offAll(Home());
    }).catchError((error){
      setState(() {
        mensagemErro = "Erro ao autenticar o usuário, verifique e-mail e senha, e tente novamente";
      });
    });
  }

  Future verificaUsuarioLogado() async {
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    //auth.signOut();
    User? usuarioLogado = await auth.currentUser;
    if(usuarioLogado != null)
      Get.offAll(Home());
  }

  @override
  void initState() {
    verificaUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2B2B2B),
      body: Container(
        padding: EdgeInsets.all(6.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Image.asset(
                    "images/logo.png",
                    height: 20.h,
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
                        controller: controllerLogin,
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
                        obscureText: true,
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
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
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
                        "Entrar",
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
                GestureDetector(
                  onTap: (){
                    Get.to(Cadastro());
                  },
                  child: Text(
                    "Não tem conta? cadastre-se!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  mensagemErro,
                  style: TextStyle(
                    color: Colors.red,
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