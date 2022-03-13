import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Tasks{
  late String id;
  String? nome;
  String? descricao;
  late DateTime data;
  Prioridade? prioridadeTarefa;
  late bool tarefaContinua;

  Tasks({
    this.nome,
    this.descricao,
    this.prioridadeTarefa,
  }){
    id = const Uuid().v4();
    data = DateTime.now();
    tarefaContinua= true;
  }

  get getDataFormatada{
    return DateFormat('dd-MM-yyyy').format(data).replaceAll('-', '/');
  }

  get getHoraTarefa{
    return DateFormat('HH:mm').format(data);
  }

  get getPrioridade{
    switch(prioridadeTarefa){
      case Prioridade.alta:
        return "Prioridade Alta";
      case Prioridade.baixa:
        return "Prioridade Baixa";
      default:
        return "Prioridade Normal";
    }
  }

  get getCardColor{
    switch(prioridadeTarefa){
      case Prioridade.alta:
        return [
          Colors.black,
          Colors.red
        ];
      case Prioridade.baixa:
        return [
          Colors.black,
          Colors.yellow
        ];
      default:
        return [
          Colors.black,
          Colors.green
        ];
    }
  }
}

enum Prioridade {
  baixa,
  normal,
  alta
}