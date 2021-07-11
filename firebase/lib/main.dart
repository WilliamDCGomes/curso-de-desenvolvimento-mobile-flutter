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
  *//*
  db.collection("noticias").document("xaoeZxJhS4HTAWjnRpFZ").setData(
      {
        "titulo": "Novo planeta é descoberto Alterado",
        "descricao": "Texto de exemplo...."
      }
  );*/

  //db.collection("usuarios").document("003").delete();

  /*DocumentSnapshot snapshot = await db.collection("usuarios").document("001").get();
  print("dados: " + snapshot.data.toString());*/

  /*QuerySnapshot querySnapshot = await db.collection("usuarios").getDocuments();
  querySnapshot.documents.forEach((element) => print("Dados usuarios " + element.data.toString()));*/
  /*
  db.collection("usuarios").snapshots().listen((snapshot) {
    snapshot.documents.forEach((element) => print("Dados usuarios " + element.data.toString()));
  });*/
  QuerySnapshot querySnapshot = await db.collection("usuarios")
      //.where("nome", isEqualTo: "Antonio")
      //.where("idade", isEqualTo: "65")
      .where("idade", isLessThan: "66")
      .getDocuments();
  querySnapshot.documents.forEach((element) => print("Filtro nome: ${element.data["nome"]} idade: ${element.data["idade"]}"));

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

