import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
            "images/youtube.png",
            width: 100,
            height: 20,
        ),
        backgroundColor: Color(0xff282828),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: (){

              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){

              }
          ),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){

              }
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
