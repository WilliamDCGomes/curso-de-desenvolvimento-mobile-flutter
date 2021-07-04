import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
class Bichos extends StatefulWidget {

  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
  AudioCache audioCache = AudioCache(prefix: "audios/");
  _execute(String musicName){
    audioCache.play(musicName);
  }

  @override
  void initState() {
    super.initState();
    audioCache.loadAll([
      "cao.mp3",
      "gato.mp3",
      "leao.mp3",
      "macaco.mp3",
      "ovelha.mp3",
      "vaca.mp3",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        GestureDetector(
          onTap: () => _execute("cao.mp3"),
          child: Image.asset("assets/images/cao.png"),
        ),
        GestureDetector(
          onTap: () => _execute("gato.mp3"),
          child: Image.asset("assets/images/gato.png"),
        ),
        GestureDetector(
          onTap: () => _execute("leao.mp3"),
          child: Image.asset("assets/images/leao.png"),
        ),
        GestureDetector(
          onTap: () => _execute("macaco.mp3"),
          child: Image.asset("assets/images/macaco.png"),
        ),
        GestureDetector(
          onTap: () => _execute("ovelha.mp3"),
          child: Image.asset("assets/images/ovelha.png"),
        ),
        GestureDetector(
          onTap: () => _execute("vaca.mp3"),
          child: Image.asset("assets/images/vaca.png"),
        ),
      ],
    );
  }
}
