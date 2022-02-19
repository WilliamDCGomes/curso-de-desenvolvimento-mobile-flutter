import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'tasks.dart';

class ViewTasks extends StatefulWidget {
  final Tasks task;
  const ViewTasks(this.task, {Key? key}) : super(key: key);

  @override
  _ViewTasksState createState() => _ViewTasksState();
}

class _ViewTasksState extends State<ViewTasks> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: const Color(0XFF202124),
            child: Stack(
              children: [
                Hero(
                  tag: widget.task.id,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: widget.task.getCardColor,
                      ),
                    ),
                    width: 100.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.h),
                          topRight: Radius.circular(5.h)
                        ),
                        color: const Color(0XFF202124),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 1.5.w),
                                  child: SizedBox(
                                    width: 90.w - 4.h,
                                    child: Text(
                                      widget.task.nome ?? "",
                                      style: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Center(
                                    child: Text(
                                      widget.task.descricao ?? "",
                                      style: TextStyle(
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 2.w, top: 2.5.h),
                                  child: Text(
                                    widget.task.getPrioridade,
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 2.w, top: 5.h, left: 2.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.task.getDataFormatada,
                                        style: TextStyle(
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        widget.task.getHoraTarefa,
                                        style: TextStyle(
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    floatingActionButton: FloatingActionButton.extended(
                      onPressed: () {

                      },
                      label: Text(
                        "Feito!",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      icon: Icon(
                        Icons.done_outline_sharp,
                        size: 4.h,
                        color: Colors.white
                      ),
                      backgroundColor: const Color(0XFF0A0F37),
                      elevation: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}