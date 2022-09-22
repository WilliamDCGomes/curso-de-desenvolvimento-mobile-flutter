import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'models/Usuario.dart';

class Mensagens extends StatefulWidget {
  late Usuario contato;
  Mensagens({
    Key? key,
    required this.contato
  }) : super(key: key);

  @override
  State<Mensagens> createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {
  List<String> listaMensagens = [
    "Olá meu amigo, tudo bem?",
    "Tudo ótimo!!! e contigo?",
    "Estou muito bem!! queria ver uma coisa contigo, você vai na corrida",
    "Não sei ainda :(",
    "Pq se você fosse, queria ver se posso ir com você...",
    "Posso te confirma no sábado? Vou ver isso",
    "Opa! tranquilo",
    "Excelente!!",
    "Estou animado para essa corrida, não vejo a hora de chegar! ;)",
    "Vai estar bem legal!! muita gente",
    "Vai sim!",
    "Lembra do carro que tinha te falado",
    "Que legal!!",
  ];
  TextEditingController _controllerMensagens = TextEditingController();

  _enviarMensagem(){

  }

  _enviarFoto(){

  }

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.h),
      borderSide: BorderSide(
        color: Color(0XFF075E54),
        width: .3.h,
      ),
    );
    var caixaMensagem = Container(
      padding: EdgeInsets.all(1.h),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: TextField(
                controller: _controllerMensagens,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                  filled: true,
                  fillColor: Color(0XFF2B2B2B),
                  hintText: "Digite uma mensagem...",
                  hintStyle: TextStyle(
                    fontSize: 2.h,
                    color: Colors.white,
                  ),
                  enabledBorder: border,
                  disabledBorder: border,
                  border: border,
                  errorBorder: border,
                  focusedBorder: border,
                  focusedErrorBorder: border,
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: Color(0XFF075E54),
                      size: 2.h,
                    ),
                    onPressed: () => _enviarFoto(),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Color(0XFF075E54),
                      size: 2.h,
                    ),
                    onPressed: () => _enviarFoto(),
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.h,
                ),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0XFF075E54),
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
            mini: true,
            onPressed: () => _enviarMensagem(),
          ),
        ],
      ),
    );

    var listView = Expanded(
      child: ListView.builder(
        itemCount: listaMensagens.length,
        itemBuilder: (context, index){
          return Align(
            alignment: index % 2 == 1 ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(2.h),
              margin: EdgeInsets.symmetric(vertical: 1.h),
              decoration: BoxDecoration(
                color: index % 2 == 1 ? Color(0XFF015C4B) : Color(0XFF202C33),
                borderRadius: BorderRadius.all(Radius.circular(1.5.h)),
              ),
              child: Text(
                listaMensagens[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          );
        },
      ),
    );

    return Scaffold(
      backgroundColor: Color(0XFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Color(0XFF015C4B),
        title: Text(
          widget.contato.nome,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(1.h),
            child: Column(
              children: [
                listView,
                caixaMensagem,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
