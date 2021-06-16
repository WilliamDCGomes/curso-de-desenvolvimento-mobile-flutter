import 'package:flutter/material.dart';
import 'package:youtube/screens/incricoes.dart';

import 'screens/biblioteca.dart';
import 'screens/emalta.dart';
import 'screens/inicio.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];
    return Scaffold(
      backgroundColor: Color(0xff282828),
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
      body: SafeArea(
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xff282828),
        items: [
          BottomNavigationBarItem(
              title: Text(
                  "Início"
              ),
              icon: Icon(
                Icons.home,
              )
          ),
          BottomNavigationBarItem(
              title: Text(
                  "Em Alta"
              ),
              icon: Icon(
                Icons.whatshot,
              )
          ),
          BottomNavigationBarItem(
              title: Text(
                  "Inscrições"
              ),
              icon: Icon(
                Icons.subscriptions,
              )
          ),
          BottomNavigationBarItem(
              title: Text(
                  "Biblioteca"
              ),
              icon: Icon(
                Icons.video_library_sharp,
              )
          ),
        ],
      ),
    );
  }
}
