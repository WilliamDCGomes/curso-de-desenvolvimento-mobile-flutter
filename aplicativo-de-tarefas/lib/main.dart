import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/tasks.dart';

import 'addTask.dart';
import 'viewTasks.dart';

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          unselectedWidgetColor:Colors.white
      ),
      home: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const Home();
        },
      ),
      debugShowCheckedModeBanner: false,
    )
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tasks> tasksList = <Tasks>[];

  _adicionarItensLista(){
    tasksList.add(
      Tasks(
        nome: "Teste 1",
        descricao: "sdbsfhdjifhsibfhwanifbu\nhwefufbuiwbsuifbuiwhsruif"
            "\nadhbuisaiudguisogifuwg\ndugduiageiuguwqigfiuoqw",
        prioridadeTarefa: Prioridade.alta,
      ),
    );
    tasksList.add(
      Tasks(
        nome: "Teste 2",
        descricao: "sdbsfhdjifhsibfhwanifbu\nhwefufbuiwbsuifbuiwhsruif"
            "\nadhbuisaiudguisogifuwg\ndugduiageiuguwqigfiuoqw",
        prioridadeTarefa: Prioridade.normal,
      ),
    );
    tasksList.add(
      Tasks(
        nome: "Teste 3",
        descricao: "sdbsfhdjifhsibfhwanifbu\nhwefufbuiwbsuifbuiwhsruif"
            "\nadhbuisaiudguisogifuwg\ndugduiageiuguwqigfiuoqw",
        prioridadeTarefa: Prioridade.baixa,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _adicionarItensLista();
    return Scaffold(
      backgroundColor: const Color(0XFF202124),
      appBar: AppBar(
        title: const Text(
          "Will Tasks",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: const Color(0XFF0A0F37),
        elevation: 5,
      ),
      body: SafeArea(
        child: ListView.builder(
            padding: EdgeInsets.all(2.h),
            itemCount: tasksList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewTasks(tasksList[index])
                    ),
                  ),
                  child: SizedBox(
                    height: 20.h,
                    child: Hero(
                      tag: tasksList[index].id,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.h),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: tasksList[index].getCardColor,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5.w, 1.h, 1.h, 1.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tasksList[index].nome ?? "",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: tasksList[index].tarefaContinua ?
                                            Colors.amberAccent : Colors.grey,
                                          size: 4.h,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      tasksList[index].descricao ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tasksList[index].getDataFormatada,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),
                                        ),
                                        Text(
                                          tasksList[index].getHoraTarefa,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: const Color(0XFF0A0F37),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AddTask(

              );
            },
          );
        },
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
