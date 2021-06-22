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

  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/dados.json");
  }

  _save() async {
    var file = await _getFile();
    _loadList();
    String data = json.encode(taskList);
    file.writeAsString(data);
  }

  _readFile() async {
    try{
      final file = await  _getFile();
      return file.readAsString();
    }
    catch(e){
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _readFile().then((data){
      setState(() {
        taskList = json.decode(data);
      });
    });
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
              title: Text(taskList[index]["title"]),
              value: taskList[index]["isFinished"],
              onChanged: (boo){

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
