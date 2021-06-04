import 'package:flutter/material.dart';
class Result extends StatefulWidget {
  Map<String, dynamic> result;
  Result(this.result);
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  TextEditingController cepController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController localidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  void _showResults(){
      cepController.text = widget.result["cep"];
      logradouroController.text = widget.result["logradouro"];
      complementoController.text = widget.result["complemento"];
      bairroController.text = widget.result["bairro"];
      localidadeController.text = widget.result["localidade"];
      ufController.text = widget.result["uf"];

  }
  @override
  Widget build(BuildContext context) {
    _showResults();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cep ${cepController.text}"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "Logradouro"
              ),
              textAlign: TextAlign.center,
              controller: logradouroController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: "Complemento"
              ),
              textAlign: TextAlign.center,
              controller: complementoController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: "Bairro"
              ),
              textAlign: TextAlign.center,
              controller: bairroController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: "Localidade"
              ),
              textAlign: TextAlign.center,
              controller: localidadeController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: "UF"
              ),
              textAlign: TextAlign.center,
              controller: ufController,
            ),
          ],
        ),
      ),
    );
  }
}
