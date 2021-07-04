import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Vogais extends StatefulWidget {

  @override
  _VogaisState createState() => _VogaisState();
}

class _VogaisState extends State<Vogais> {
  AudioCache audioCache = AudioCache(prefix: "audios/");
  _execute(String musicName){
    audioCache.play(musicName);
  }

  @override
  void initState() {
    super.initState();
    audioCache.loadAll([

    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        GestureDetector(
          onTap: () => _execute(".mp3"),
          child: Image.asset("assets/images/.png"),
        ),
      ],
    );
  }
}
