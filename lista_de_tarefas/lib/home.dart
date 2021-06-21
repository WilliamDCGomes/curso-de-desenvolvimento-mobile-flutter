import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'tasks.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List taskList = List();
  void _loadList(){
    Map<String, dynamic> tasks = Map();
    tasks["title"] = "Ir ao mercado";
    tasks["isFinished"] = false;
    taskList.add(tasks);
  }

  _save() async {
    final directory = await getApplicationDocumentsDirectory();
    var file =  File("${directory.path}/dados.json");
    _loadList();
    String data = json.encode(taskList);
    file.writeAsString(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Lista de tarefas",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index){
            return CheckboxListTile(
              activeColor: Colors.purple,
              title: Text(taskList[index].title),
              value: taskList[index].isCompleted,
              onChanged: (va){

              }
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    decoration: InputDecoration(
                      labelText: "Digite sua tarefa"
                    ),
                    onChanged: (text){
                      Navigator.pop(context);
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Colors.purple
                          ),
                        )
                    ),
                    FlatButton(
                        onPressed: (){

                        },
                        child: Text(
                          "Salvar",
                          style: TextStyle(
                              color: Colors.purple
                          ),
                        )
                    ),
                  ],
                );
              }
          );
        },
      ),
    );
  }
}
