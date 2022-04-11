import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  TextEditingController _nomeController = TextEditingController();
  bool temFoto = true;
  bool subindoImagem = false;
  String _idUsuarioLogado = "";
  XFile? _imagem;
  String _urlImagemRecuperada = "";

  Future _recuperarImagem(String origemImagem) async {
    XFile? imagemSelecionada;
    ImagePicker _picker = ImagePicker();
    switch(origemImagem){
      case "camera":
        imagemSelecionada = await _picker.pickImage(source: ImageSource.camera);
        break;
      case "galeria":
        imagemSelecionada = await _picker.pickImage(source: ImageSource.gallery);
        break;
    }
    if(imagemSelecionada != null){
      setState(() {
        _imagem = imagemSelecionada;
        setState(() {
          subindoImagem = true;
        });
        _uploadImagem();
      });
    }
  }

  Future _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz
        .child("perfil")
        .child("imagem_perfil_" + _idUsuarioLogado + ".jpg");
    File imagem = File(_imagem!.path);
    UploadTask task = arquivo.putFile(imagem);
    await Future.delayed(Duration(seconds: 5));
    _recuperarUrlImagem(task.snapshot);
  }

  _recuperarUrlImagem(TaskSnapshot snapshot) async {
    String image = await snapshot.ref.getDownloadURL();
    setState(() {
      _urlImagemRecuperada = image;
      subindoImagem = false;
    });
  }

  _recuperaDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = await auth.currentUser;
    if(usuarioLogado != null){
      _idUsuarioLogado = usuarioLogado.uid;
    }
  }

  @override
  void initState() {
    _recuperaDadosUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Color(0XFF096A63),
        title: Text(
          "Configurações",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 25.h,
                width: 25.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5.h),
                  color: Color(0XFFF0F0F0),
                ),
                child: subindoImagem ?
                CircularProgressIndicator() : (
                  temFoto && _urlImagemRecuperada != "" ?
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.5.h),
                    child: Image.network(
                      _urlImagemRecuperada,
                    ),
                  ) :
                  Center(
                    child: Text(
                      "Sem Foto",
                      style: TextStyle(
                        color: Color(0XFF2B2B2B),
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _recuperarImagem("camera"),
                      child: Text(
                        "Câmera",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: () => _recuperarImagem("galeria"),
                      child: Text(
                        "Galeria",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Container(
                  height: 5.h,
                  width: 80.w,
                  padding: EdgeInsets.only(top: 0.5.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: TextField(
                      controller: _nomeController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          hintText: "Digite o nome",
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
                padding: EdgeInsets.only(top: 2.h),
                child: SizedBox(
                  height: 5.h,
                  width: 35.w,
                  child: RaisedButton(
                    onPressed: (){

                    },
                    color: Colors.green,
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.5.h),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
