import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Icon(
                      icon: Icons.user
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 2.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
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
                Container(
                  padding: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: SizedBox(
                    height: 5.h,
                    child: RaisedButton(
                      onPressed: (){

                      },
                      color: Colors.green,
                      child: Text(
                        "Entrar",
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
                GestureDetector(
                  onTap: (){

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
