import 'package:flutter/material.dart';
import 'package:minhas_anotacoes/helper/anotacaoHelper.dart';
import 'package:minhas_anotacoes/model/Anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao> anotacoes = List<Anotacao>();
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

  _recuperarAnotacoes() async {
    anotacoes.clear();
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
    anotacoesRecuperadas.forEach((element) {
      setState(() {
        anotacoes.add(Anotacao.fromMap(element));
      });
    });
  }

  _salvarAnotacao() async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    Anotacao anotacao = Anotacao(title, description, DateTime.now().toString());
    int result = await _db.salvarAnotacao(anotacao);
    _titleController.clear();
    _descriptionController.clear();
    _recuperarAnotacoes();
  }

  _formatDate(String date){
    initializeDateFormatting("pt_BR");
    //var formater = DateFormat("dd/MMM/yyyy HH:mm:ss");
    var formater = DateFormat.MMMMEEEEd("pt_BR");
    return formater.format(DateTime.parse(date));
  }

  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
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
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                itemCount: anotacoes.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      title: Text(anotacoes[index].title),
                      subtitle: Text("${_formatDate(anotacoes[index].date)} - ${anotacoes[index].description}"),
                    ),
                  );
                }
              )
          )
        ],
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
