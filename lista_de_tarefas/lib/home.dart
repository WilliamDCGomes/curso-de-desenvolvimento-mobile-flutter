import 'package:flutter/material.dart';

import 'tasks.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> test = List<Task>();
  void _loadList(){
    test.clear();
    test.add(Task("Ir ao mercado", false));
    test.add(Task("estudar", false));
    test.add(Task("teste", true));
  }
  @override
  Widget build(BuildContext context) {
    _loadList();
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
          itemCount: test.length,
          itemBuilder: (context, index){
            return CheckboxListTile(
              activeColor: Colors.purple,
              title: Text(test[index].title),
              value: test[index].isCompleted,
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
      ),
    );
  }
}
