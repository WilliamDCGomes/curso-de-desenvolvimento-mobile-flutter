import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _items = [];
  void _loadList(){
    for(int i=0; i<50; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} Lorem ipsum dolor sit amet";
      item["descricao"] = "Descrição ${i} Lorem ipsum dolor sit amet";
      _items.add(item);
    }
  }
  @override
  Widget build(BuildContext context) {
    _loadList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(_items[index]["titulo"]),
                subtitle: Text(_items[index]["descricao"]),
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(_items[index]["titulo"]),
                          content: Text(_items[index]["descricao"]),
                          actions: <Widget>[
                            FlatButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("OK")
                            ),
                            FlatButton(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("CANCELAR")
                            ),
                          ],
                        );
                      }
                  );
                },
              );
            },

        ),
      ),
    );
  }
}
