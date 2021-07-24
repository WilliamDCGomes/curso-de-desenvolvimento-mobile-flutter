import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Firestore db = Firestore.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection("usuarios").doc("002").set(
      {
        "nome": "Ana Maria",
        "idade": "20"
      }
  );
  DocumentReference ref = await db.collection("noticias").add(
    {
      "titulo": "Novo planeta é descoberto",
      "descricao": "Texto de exemplo...."
    }
  );

  print("id salvo " + ref.id);
  /*
  db.collection("noticias").document("xaoeZxJhS4HTAWjnRpFZ").setData(
      {
        "titulo": "Novo planeta é descoberto Alterado",
        "descricao": "Texto de exemplo...."
      }
  );*/

  db.collection("usuarios").doc("003").delete();

  DocumentSnapshot snapshot = await db.collection("usuarios").doc("001").get();
  print("dados: " + snapshot.data().toString());

  QuerySnapshot querySnapshot = await db.collection("usuarios").get();
  querySnapshot.docs.forEach((element) => print("Dados usuarios " + element.data().toString()));

  db.collection("usuarios").snapshots().listen((snapshot) {
    snapshot.docs.forEach((element) => print("Dados usuarios " + element.data().toString()));
  });
  /*QuerySnapshot querySnapshot = await db.collection("usuarios")
      //.where("nome", isEqualTo: "Antonio")
      //.where("idade", isEqualTo: "65")
      .where("idade", isLessThan: "66")
      .getDocuments();
  querySnapshot.documents.forEach((element) => print("Filtro nome: ${element.data["nome"]} idade: ${element.data["idade"]}"));
  */
  /*QuerySnapshot querySnapshot = await db.collection("usuarios")
      //.where("nome", isEqualTo: "Antonio")
      //.where("idade", isEqualTo: "65")
      .where("nome", isGreaterThanOrEqualTo: "C")
      .where("nome", isLessThanOrEqualTo: "C" + "\uf8ff")
      .getDocuments();
  querySnapshot.documents.forEach((element) => print("Filtro nome: ${element.data["nome"]} idade: ${element.data["idade"]}"));
*/
  /*FirebaseAuth auth = FirebaseAuth.instance;
  String email = "teste@gmail.com";
  String senha = "123456";
  auth.createUserWithEmailAndPassword(email: email, password: senha).then(
          (firebaseUser) {
            print("Sucesso ao cadastrar");
          }).catchError((error) => print("Erro: " + error.toString()));
  auth.signOut(); // Para deslogar o usuario
  auth.signInWithEmailAndPassword(email: email, password: senha); // Fazer login com o usuario
  FirebaseUser usuarioAtual = await auth.currentUser();
  if(usuarioAtual != null){
    print("Usuario logado");
  }*/
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  File _image;
  Future _recuperarImagem(bool fromCamera) async {
    File imagemSelecionada;
    if(fromCamera){
      imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
    }
    else{
      imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = imagemSelecionada;
    });
  }
  Future _uploadImages() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("foto1.jpg");
    StorageUploadTask task = arquivo.putFile(_image);
    task.events.listen((event) {
      if(event.type == StorageTaskEventType.progress){

      }
      else if(event.type == StorageTaskEventType.success){

      }
    });
    String urlDaImagem;
    task.onComplete.then((value) async {
      urlDaImagem = await value.ref.getDownloadURL().toString();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar imagem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("Camera"),
                onPressed: (){
                  _recuperarImagem(true);
                }
            ),
            RaisedButton(
                child: Text("Galeria"),
                onPressed: (){
                  _recuperarImagem(false);
                }
            ),
            _image == null ? Container() : Image.file(_image),
            RaisedButton(
                child: Text("Upload Storage"),
                onPressed: (){
                  _uploadImages();
                }
            ),
          ],
        ),
      ),
    );
  }
}

