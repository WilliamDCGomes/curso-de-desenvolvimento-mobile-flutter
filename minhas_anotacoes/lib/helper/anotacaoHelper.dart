import 'package:flutter/foundation.dart';
import 'package:minhas_anotacoes/model/Anotacao.dart';
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
    if(_db != null)
      return _db;
    else{
      _db = await inicializeDB();
      return _db;
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

  Future<int> salvarAnotacao(Anotacao anotacao) async {
    var dataBase = await db;
    return await dataBase.insert("anotacao", anotacao.toMap());
  }

}
