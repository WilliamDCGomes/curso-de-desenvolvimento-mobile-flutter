import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../models/Usuario.dart';

class AbaContatos extends StatefulWidget {
  const AbaContatos({Key? key}) : super(key: key);

  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {
  late String _idUsuarioLogado;
  late String _emailUsuarioLogado;

  @override
  void initState() {
    super.initState();
    _recuperaDadosUsuario();
  }

  Future<List<Usuario>> _recuperarContatos() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    var querySnapshot = await db.collection("usuarios").get();

    List<Usuario> listaUsuarios = <Usuario>[];
    for(var item in querySnapshot.docs){
      var dados = item.data();
      if(dados["email"] != _emailUsuarioLogado){
        Usuario usuario = Usuario();
        usuario.email = dados["email"];
        usuario.nome = dados["nome"];
        usuario.urlImagem = dados["urlImagem"];
        listaUsuarios.add(usuario);
      }
    }
    return listaUsuarios;
  }

  _recuperaDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = await auth.currentUser;
    if(usuarioLogado != null){
      _idUsuarioLogado = usuarioLogado.uid;
      _emailUsuarioLogado = usuarioLogado.email!;

    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Usuario>>(
      future: _recuperarContatos(),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                children: [
                  Text("Carregando contatos"),
                  CircularProgressIndicator(),
                ],
              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                Usuario usuario = snapshot.data![index];
                var siglaNome = usuario.nome.split(' ');
                return Padding(
                  padding: EdgeInsets.all(1.h),
                  child: SizedBox(
                    height: 12.h,
                    child: Card(
                      elevation: 3,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.h),
                      ),
                      color: Color(0XFF096A63),
                      child: Padding(
                        padding: EdgeInsets.all(.5.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Container(
                                height: 8.h,
                                width: 8.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.h),
                                  color: Color(0XFF2B2B2B),
                                ),
                                child: usuario.urlImagem.isNotEmpty ?
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.h),
                                  child: Image.network(
                                    usuario.urlImagem,
                                  ),
                                ) :
                                Center(
                                  child: Text(
                                    siglaNome[0].substring(0, 1) + siglaNome[1].substring(0, 1),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.sp,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              usuario.nome,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
        }
      }
    );
  }
}
