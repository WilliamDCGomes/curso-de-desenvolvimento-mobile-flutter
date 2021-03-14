import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offSet = 0;
  Future<Map> _getGifs() async{
    http.Response response;
    if(_search == null){
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=KeakpdpTwZVAgFb2uQOptejp5XAI6w6e&limit=30&rating=g");
    }
    else{
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=KeakpdpTwZVAgFb2uQOptejp5XAI6w6e&q=$_search&limit=30&offset=$_offSet&rating=g&lang=pt");
    }
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
