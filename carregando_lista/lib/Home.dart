import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Post.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String urlBase = "https://jsonplaceholder.typicode.com";
  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(urlBase + "/posts");
    var dadosJson = jsonDecode(response.body);
    List<Post> postagens = List();
    for(var post in dadosJson){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }
  Widget GetFuture(){
    return FutureBuilder<List<Post>>(
      future: _recuperarPostagens(),
      builder: (context, snapshot){
        String resultado;
        switch(snapshot.connectionState){
          case ConnectionState.none:
            resultado = "Sem conexão";
            break;
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator()
            );
            break;
          case ConnectionState.active:
            resultado = "Mantem ativo enquanto recebe dados";
            break;
          case ConnectionState.done:
            if(snapshot.hasError)
              resultado = "Erro ao carregar os dados";
            else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    Post post = snapshot.data[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },

              );
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trabalhando com Future e Lista"),
      ),
      body: GetFuture()
    );
  }
}
