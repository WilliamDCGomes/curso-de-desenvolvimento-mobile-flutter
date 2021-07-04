import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  executar() async {
    //int result = await audioPlayer.play("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
    audioPlayer = await audioCache.play("musica.mp3");
    /*if(result == 1){
      print("sucesso");
    }
    else{
      print("erro");
    }*/
  }
  @override
  Widget build(BuildContext context) {
    executar();
    return Container();
  }
}
