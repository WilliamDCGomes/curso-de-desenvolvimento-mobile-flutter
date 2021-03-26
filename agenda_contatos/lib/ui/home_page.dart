import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  @override
  void initState(){
    super.initState();
    /*Contact c = Contact();
    c.name = "william douglas";
    c.email="williamdouglasgomes@hotmail.com";
    c.phone = "265261151";
    c.img = "imgtest";
    helper.saveContact(c);*/
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
