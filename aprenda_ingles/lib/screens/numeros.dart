import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
class Numeros extends StatefulWidget {

  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {
  AudioCache audioCache = AudioCache(prefix: "audios/");
  _execute(String musicName){
    audioCache.play(musicName);
  }

  @override
  void initState() {
    super.initState();
    audioCache.loadAll([
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return  GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        GestureDetector(
          onTap: () => _execute("1.mp3"),
          child: Image.asset("assets/images/1.png"),
        ),
        GestureDetector(
          onTap: () => _execute("2.mp3"),
          child: Image.asset("assets/images/2.png"),
        ),
        GestureDetector(
          onTap: () => _execute("3.mp3"),
          child: Image.asset("assets/images/3.png"),
        ),
        GestureDetector(
          onTap: () => _execute("4.mp3"),
          child: Image.asset("assets/images/4.png"),
        ),
        GestureDetector(
          onTap: () => _execute("5.mp3"),
          child: Image.asset("assets/images/5.png"),
        ),
        GestureDetector(
          onTap: () => _execute("6.mp3"),
          child: Image.asset("assets/images/6.png"),
        ),
      ],
    );
  }
}