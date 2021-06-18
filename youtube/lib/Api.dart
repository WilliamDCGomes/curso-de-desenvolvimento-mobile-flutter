import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/video.dart';
const CHAVE_YOUTUBE_API = "";
const ID_CANAL = "UCferfyAeOJAjS9GoI4td6gg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> search(String stringSearch) async {
    http.Response response = await  http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          //"&channelId=$ID_CANAL"
          "&q=$stringSearch"
    );
    if(response.statusCode == 200){
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Video> VideosRecuperados = jsonData["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      return VideosRecuperados;
    }
    else{

    }

  }
}