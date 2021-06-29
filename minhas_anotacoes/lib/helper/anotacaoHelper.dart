import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotacaoHelper{
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database _db;
  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }
  AnotacaoHelper._internal(){
  }

  get db async{
    if(db != null)
      return db;
    else{

    }
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE anotacao (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR, description TEXT, data DATETIME)");
  }

  inicializeDB() async {
    final dataBasePath = await getDatabasesPath();
    final dataBaseLocal = join(dataBasePath, "data_minhas_anotacoes.db");
    var db = await openDatabase(
      dataBaseLocal,
      version: 1,
      onCreate: _onCreate
    );
    return db;
  }

}
