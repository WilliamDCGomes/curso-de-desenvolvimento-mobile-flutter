import 'package:flutter/material.dart';
 class HomeCompany extends StatefulWidget {
   const HomeCompany({Key key}) : super(key: key);
 
   @override
   _HomeCompanyState createState() => _HomeCompanyState();
 }
 
 class _HomeCompanyState extends State<HomeCompany> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(
           "Empresa",
           style: TextStyle(color: Colors.white),
         ),
         backgroundColor: Colors.green,
       ),
       body: SingleChildScrollView(
         child: Container(
           padding: EdgeInsets.all(20.0),
           child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   Image.asset("images/detalhe_empresa.png"),
                   Text(
                     "Sobre a empresa",
                     style: TextStyle(
                         color: Colors.deepOrange,
                         fontSize: 20.0
                     ),
                   )
                 ],
               ),
               Divider(),
               Text(
                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin condimentum diam non justo posuere, vitae faucibus ligula pretium. Nulla facilisi. Aliquam erat volutpat. Cras ac est ac tellus pulvinar tempus. Aliquam imperdiet nisi nec nisl fermentum, a sagittis justo faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis eget venenatis justo, ut laoreet arcu. Vivamus nunc purus, fermentum nec finibus quis, finibus ac turpis. Curabitur vitae orci at metus tincidunt facilisis. Suspendisse neque urna, tincidunt hendrerit enim posuere, fermentum egestas libero. Pellentesque viverra mollis massa, sit amet sollicitudin dolor pretium a. Nam eget massa mauris. Fusce at convallis nisi, vel elementum libero. Phasellus condimentum urna nec tortor luctus, ut pulvinar metus pharetra. Nulla venenatis consectetur vulputate. Sed pharetra fringilla consequat. Nulla ornare eu leo ac lobortis. Nulla at eleifend erat, in volutpat sem. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis maximus, erat sed pretium varius, nisi tellus sollicitudin risus, iaculis bibendum tellus magna id erat. Vestibulum ac nunc at nunc fermentum pulvinar at vitae mi. Proin vel tempor dui. Ut sed sollicitudin magna, rutrum molestie est. Mauris viverra nisl vitae odio pharetra sollicitudin. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus quis ex nunc. Vivamus mattis finibus magna, eu accumsan quam elementum et. Cras semper vel augue a molestie. Aliquam sit amet molestie felis. Sed pretium enim sed ex vulputate, at facilisis enim dignissim. Maecenas consequat justo neque, quis aliquam sem ullamcorper a. Proin sagittis, magna eget tincidunt lacinia, eros ligula dignissim urna, vel faucibus elit mi sed nibh. Sed ut justo turpis. Vestibulum augue ligula, gravida sed sapien non, facilisis tincidunt velit. Nunc efficitur diam id lorem vulputate ornare. Etiam porta ipsum a nibh porta suscipit. Ut vulputate interdum lectus, ut ornare odio dignissim non. Aliquam euismod metus sed turpis iaculis pellentesque. Fusce aliquam augue urna, et feugiat nisi porttitor nec. Sed id pulvinar mauris. Duis et pharetra ipsum, ut bibendum ligula.",

               )
             ],
           ),
         ),
       )
     );
   }
 }
 