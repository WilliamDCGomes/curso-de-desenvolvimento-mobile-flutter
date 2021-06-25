import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List list = [
    "Jamilton",
    "Maria",
    "João",
    "Carla"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Widgets"
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            final item = list[index];
            return Dismissible(
              background: Container(
                color: Colors.green,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
                secondaryBackground: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                direction: DismissDirection.horizontal,
                onDismissed: (direction){
                  if(direction == DismissDirection.endToStart){

                  }
                  else if(direction == DismissDirection.startToEnd){

                  }
                },
                key: Key(item),
                child: ListTile(
                  title: Text(item),
                )
            );
          }
        ),
      ),
    );
  }
}
