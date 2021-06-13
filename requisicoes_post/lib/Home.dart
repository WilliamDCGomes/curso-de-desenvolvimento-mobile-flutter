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

  _post() async {
    var body = json.encode(
        {
          "userId": 42,
          "id": null,
          "title": "Teste Will Flutter 2021",
          "body": "Corpo da Postagem"
        }
    );
    http.Response response = await http.post(
      urlBase + "/posts",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: body
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _put(){

  }

  _patch(){

  }

  _delete(){

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
        title: Text("Requisição Post"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                    onPressed: _post,
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: FlatButton(
                      onPressed: _post,
                      child: Text(
                        "Atualizar",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                ),
                FlatButton(
                    onPressed: _post,
                    child: Text(
                      "Remover",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                ),
              ],
            ),
            Expanded(
                child: GetFuture()
            )
          ],
        ),
      )
    );
  }
}
