import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../models/Conversa.dart';

class AbaContatos extends StatefulWidget {
  const AbaContatos({Key? key}) : super(key: key);

  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {
  List<Conversa> listaConversa = [
    Conversa(
        "William Douglas",
        "Recriando o Whatsapp com Flutter e Firebase",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-32bef.appspot.com/o/perfil%2Fperfil0.jpg?alt=media&token=0032bd01-1492-441f-bf73-599744882771"
    ),
    Conversa(
        "Jamilton Damasceno",
        "Olá, tudo bem?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-32bef.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=05f2a431-d10c-471d-8ca1-cc57437de2ea"
    ),
    Conversa(
        "Marcela Silva",
        "Vou jogar basket, vlw",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-32bef.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=2aa1f8db-8435-46eb-823f-a4f8bf94c7b9"
    ),
    Conversa(
        "Lucas Ferreira",
        "Me ajuda a tirar aquela música",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-32bef.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=f45e7ac0-4c34-4b7a-8ba9-273d229ac71d"
    ),
    Conversa(
        "Carla Carneiro",
        "Me indica uma série?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-32bef.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=38e5cca4-ef88-449d-b7be-36d31431c5d3"
    ),
    Conversa(
        "Renan Sabino",
        "Estou fazendo montagens com vídeos!!",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-32bef.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=abcbfedd-86de-49ea-9eb5-04c915f4d877"
    ),
    Conversa(
        "André Ribeiro",
        "Estou sem foto de perfil!",
        ""
    ),
  ];

  @override
  void initState() {
    listaConversa.sort((a, b) => a.nome.compareTo(b.nome));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaConversa.length,
      itemBuilder: (context, index){
        var siglaNome = listaConversa[index].nome.split(' ');
        return Padding(
          padding: EdgeInsets.all(1.h),
          child: SizedBox(
            height: 12.h,
            child: Card(
              elevation: 3,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.h),
              ),
              color: Color(0XFF096A63),
              child: Padding(
                padding: EdgeInsets.all(.5.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Container(
                        height: 8.h,
                        width: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.h),
                          color: Color(0XFF2B2B2B),
                        ),
                        child: listaConversa[index].caminhoFoto.isNotEmpty ?
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.h),
                          child: Image.network(
                            listaConversa[index].caminhoFoto,
                          ),
                        ) :
                        Center(
                          child: Text(
                            siglaNome[0].substring(0, 1) + siglaNome[1].substring(0, 1),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      listaConversa[index].nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
