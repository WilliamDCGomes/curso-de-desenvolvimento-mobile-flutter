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
  bool firstExecutation = true;
  executar() async {
    //int result = await audioPlayer.play("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
    if(firstExecutation) {
      audioPlayer = await audioCache.play("musica.mp3");
      firstExecutation = false;
    }
    else{
      audioPlayer.resume();
    }
    /*if(result == 1){
      print("sucesso");
    }
    else{
      print("erro");
    }*/
  }

  pausar() async {
    if(!firstExecutation) {
      int result = await audioPlayer.pause();
      if (result == 1) {
        print("sucesso");
      }
    }
  }

  parar() async {
    if(!firstExecutation) {
      int result = await audioPlayer.stop();
      if (result == 1) {
        print("sucesso");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Executando sons"),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: 5,
            max: 10,
            min: 0,
            onChanged: (value){
              setState(() {

              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: executar,
                  child: Image.asset("assets/images/executar.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: pausar,
                  child: Image.asset("assets/images/pausar.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: parar,
                  child: Image.asset("assets/images/parar.png"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
