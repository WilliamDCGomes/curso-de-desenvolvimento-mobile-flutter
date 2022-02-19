import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'buttonLoadingWidget.dart';
import 'datePicker.dart';
import 'tasks.dart';
import 'textFieldWidget.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController nomeTarefaInput = TextEditingController();
  TextEditingController descricaoTarefaInput = TextEditingController();
  final RoundedLoadingButtonController addTaskButton = RoundedLoadingButtonController();
  Prioridade? valueRadio = Prioridade.normal;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0XFF202124),
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.5.h),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SizedBox(
          width: 88.w,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(2.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.5.h),
                        child: Text(
                          "Adicionar Tarefa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 3.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: TextFieldWidget(
                          controller: nomeTarefaInput,
                          hintText: "Digite o nome da tarefa",
                          width: 75.w,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: SizedBox(
                          height: 20.h,
                          child: TextFieldWidget(
                            controller: descricaoTarefaInput,
                            hintText: "Digite a descrição da tarefa",
                            width: 75.w,
                            maxLines: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: GestureDetector(
                          onTap: (){
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const DatePicker(

                                );
                              },
                            );
                          },
                          child: TextFieldWidget(
                            controller: descricaoTarefaInput,
                            hintText: "Informe a data",
                            width: 75.w,
                            ableField: false,
                            maxLines: 1,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: .5.h),
                        child: Text(
                          "Prioridade",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 2.5.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                        child: RadioListTile<Prioridade>(
                          title: const Text('Baixa'),
                          value: Prioridade.baixa,
                          groupValue: valueRadio,
                          onChanged: (Prioridade? value) {
                            setState(() {
                              valueRadio = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                        child: RadioListTile<Prioridade>(
                          title: const Text('Normal'),
                          value: Prioridade.normal,
                          groupValue: valueRadio,
                          onChanged: (Prioridade? value) {
                            setState(() {
                              valueRadio = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                        child: RadioListTile<Prioridade>(
                          title: const Text('Alta'),
                          value: Prioridade.alta,
                          groupValue: valueRadio,
                          onChanged: (Prioridade? value) {
                            setState(() {
                              valueRadio = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                        child: ButtonLoadingWidget(
                          widthButton: 80.w,
                          controller: addTaskButton,
                          color: Colors.red,
                          borderRadius: 1.h,
                          onPressed: () async {

                          },
                          textColor: Colors.white,
                          valueColor: Colors.white,
                          hintText: "ADICIONAR",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 4.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
