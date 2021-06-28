import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();
  _showCadastreScreen(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Adicionar anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Título",
                    hintText: "Digite o Título"
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Descrição",
                    hintText: "Digite a Descrição"
                  ),
                ),
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar"
                  )
              ),
              FlatButton(
                  onPressed: (){

                    Navigator.pop(context);
                  },
                  child: Text(
                    "Salvar"
                  )
              ),
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minhas anotações",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: Icon(
          Icons.add
        ),
        onPressed: (){
          _showCadastreScreen();
        },
      ),
    );
  }
}
