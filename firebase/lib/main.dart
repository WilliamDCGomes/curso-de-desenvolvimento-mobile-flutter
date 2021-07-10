import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore db = Firestore.instance;
  /*
  db.collection("usuarios").document("002").setData(
      {
        "nome": "Ana Maria",
        "idade": "20"
      }
  );
  *//*
  DocumentReference ref = await db.collection("noticias").add(
    {
      "titulo": "Novo planeta é descoberto",
      "descricao": "Texto de exemplo...."
    }
  );

  print("id salvo " + ref.documentID);
  */
  db.collection("noticias").document("xaoeZxJhS4HTAWjnRpFZ").setData(
      {
        "titulo": "Novo planeta é descoberto Alterado",
        "descricao": "Texto de exemplo...."
      }
  );

  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

