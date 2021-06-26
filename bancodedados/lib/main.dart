import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
void main(){
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _getDataBase() async {
    final dataBasePath = await getDatabasesPath();
    final dataBaseLocal = join(dataBasePath, "banco.db");
    var getData = await openDatabase(
      dataBaseLocal,
      version: 1,
      onCreate: (db, dbVersion){
        db.execute("CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, age INTEGER)");
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
