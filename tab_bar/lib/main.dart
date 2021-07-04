import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              //text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              //text: "Email",
              icon: Icon(Icons.email),
            ),
            Tab(
              //text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text("Primeira pagina")),
          Center(child: Text("Segunda pagina")),
          Center(child: Text("Terceira pagina")),
        ],
      ),
    );
  }
}

