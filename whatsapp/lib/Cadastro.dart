import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var controllerName = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  String mensagemErro = '';

  validarCampos(){
    if(controllerName.text.trim().isNotEmpty &&
        controllerEmail.text.trim().isNotEmpty &&
        controllerPassword.text.trim().isNotEmpty){
      setState(() {
        mensagemErro = "";
      });
      cadastrarUsuario();
    }
    else{
      setState(() {
        mensagemErro = "Preencha todos os campos";
      });
    }
  }

  cadastrarUsuario(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Color(0XFF096A63),
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
                    child: RaisedButton(
                      onPressed: (){
                        validarCampos();
                      },
                      color: Colors.green,
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                    ),
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
