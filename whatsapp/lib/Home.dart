import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Configuracoes.dart';
import 'package:whatsapp/Login.dart';
import 'package:whatsapp/telas/AbaContatos.dart';
import 'telas/AbaConversas.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> itensMenu = [
    "Configurações",
    "Sair"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  _escolhaMenuItem(String itemEscolhido) async {
    switch(itemEscolhido){
      case "Configurações":
        Get.to(Configuracoes());
        break;
      case "Sair":
        FirebaseAuth.instance.signOut();
        await Future.delayed(Duration(milliseconds: 200));
        Get.offAll(Login());
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Color(0XFF015C4B),
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context){
              return itensMenu.map((item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(
                    item
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AbaConversas(),
          AbaContatos(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0XFF015C4B),
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 4,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(
              text: "Conversas",
            ),
            Tab(
              text: "Contatos",
            ),
          ],
        ),
      ),
    );
  }
}
