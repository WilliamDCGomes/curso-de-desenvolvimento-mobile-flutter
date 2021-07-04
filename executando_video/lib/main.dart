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
      "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"
    )..initialize().then((_){
      setState(() {
        videoPlayerController.play();
      });
    });
    /*videoPlayerController = VideoPlayerController.asset(
      "videos/exemplo.mp4"
    )..setLooping(true)..initialize().then((_){
      videoPlayerController.play();
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: videoPlayerController.value.initialized ? AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: VideoPlayer(
            videoPlayerController
          ),
        ) : Text("Pressione o play"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow
        ),
        onPressed: (){
          setState(() {
            videoPlayerController.value.isPlaying ? videoPlayerController.pause() : videoPlayerController.play();
          });
        },
      ),
    );
  }
}
