import 'package:flutter/material.dart';
import 'package:youtube/model/video.dart';

import '../Api.dart';

class Inicio extends StatefulWidget {
  String search;
  Inicio(this.search);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listVideo(String search) {
    Api api = Api();
    return api.search(search);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listVideo(widget.search),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context, index){
                    return Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * .35,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data[index].image),
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                snapshot.data[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    snapshot.data[index].channelTitle,
                                    style: TextStyle(
                                      color: Color(0xffF0F0F0),
                                      fontSize: 20
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    ".",
                                    style: TextStyle(
                                        color: Color(0xffF0F0F0),
                                        fontSize: 20
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    snapshot.data[index].publishedAt,
                                    style: TextStyle(
                                      color: Color(0xffF0F0F0),
                                      fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  itemCount: snapshot.data.length
              );
            }
            break;
        }
        return Center(
          child: Text(
              "Nenhum dado para ser exibido!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25
              ),
          ),
        );
      }
    );
  }
}
