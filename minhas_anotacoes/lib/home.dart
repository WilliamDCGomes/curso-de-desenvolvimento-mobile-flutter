import 'package:flutter/material.dart';
import 'package:minhas_anotacoes/helper/anotacaoHelper.dart';
import 'package:minhas_anotacoes/model/Anotacao.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _db = AnotacaoHelper();
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
                    _salvarAnotacao();
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

  _salvarAnotacao() async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    Anotacao anotacao = Anotacao(title, description, DateTime.now().toString());
    int result = await _db.salvarAnotacao(anotacao);
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
