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
    return await openDatabase(
      dataBaseLocal,
      version: 1,
      onCreate: (db, dbVersion){
        db.execute("CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, age INTEGER)");
      },
    );
  }

  _save() async {
    Database db = await _getDataBase();
    Map<String, dynamic> userData = {
      "name": "William Douglas",
      "age": 23
    };
    int id = await db.insert("user", userData);
    print("Testes " + id.toString());
  }

  _listUsers() async {
    Database db = await _getDataBase();
    List users = await db.rawQuery("SELECT * FROM user");

  }

  _getUser(int id) async {
    Database db = await _getDataBase();
    List user = await db.query(
        "users",
        columns: ["id", "name", "age"],
        where: "id = ?",
        whereArgs: [id]
    );
  }

  _deleteUser(int id) async{
    Database db = await _getDataBase();
    int getReturn = await db.delete(
      "user",
      where: "id = ?",
      whereArgs: [id]
    );
  }

  _updateUser(int id) async{
    Database db = await _getDataBase();

    Map<String, dynamic> userData = {
      "name": "William Douglas Costa Gomes",
      "age": 23
    };
    int getReturns = await db.update(
      "user",
      userData,
      where: "id = ?",
      whereArgs: [id]
    );
  }

  @override
  Widget build(BuildContext context) {
    _save();
    return Container();
  }
}
