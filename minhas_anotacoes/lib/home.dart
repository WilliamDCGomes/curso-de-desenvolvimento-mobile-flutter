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
  _showCadastreScreen({Anotacao anotacao}){
    String title = "Adicionar anotação";
    String buttonText = "Salvar";
    if(anotacao != null){
      _titleController.text = anotacao.title;
      _descriptionController.text = anotacao.description;
      title = "Atualizar anotações";
      buttonText = "Atualizar";
    }
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(title),
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
                    _salvarAnotacao(anotacaoSelecionada: anotacao);
                    Navigator.pop(context);
                  },
                  child: Text(
                    buttonText
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

  _salvarAnotacao({Anotacao anotacaoSelecionada}) async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    if(anotacaoSelecionada == null) {
      Anotacao anotacao = Anotacao(title, description, DateTime.now().toString());
      int result = await _db.salvarAnotacao(anotacao);
    }
    else {
      anotacaoSelecionada.title = title;
      anotacaoSelecionada.description = description;
      anotacaoSelecionada.date = DateTime.now().toString();
      int result = await _db.atualizarAnotacao(anotacaoSelecionada);
    }
    _titleController.clear();
    _descriptionController.clear();
    _recuperarAnotacoes();
  }
  _removerAnotacao(int id) async {
    int result = await _db.removerAnotacao(id);
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => _showCadastreScreen(anotacao: anotacoes[index]),
                            child: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Deseja mesmo excluir essa anotação?"),
                                      actions: [
                                        FlatButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                                "Não"
                                            )
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              _removerAnotacao(
                                                  anotacoes[index].id);
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                                "Sim"
                                            )
                                        ),
                                      ],
                                    );
                                  }
                              );
                            },
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
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
