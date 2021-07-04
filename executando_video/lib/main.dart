import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
      "https://www.youtube.com/watch?v=j2K1Dr3LIN8&ab_channel=CanalPeeWee"
    )..initialize().then((_){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
