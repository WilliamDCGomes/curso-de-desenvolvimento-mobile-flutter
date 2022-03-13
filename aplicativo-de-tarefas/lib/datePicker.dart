import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'buttonWidget.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0XFF202124),
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.5.h),
      ),
      child: SizedBox(
        height: 50.h,
        width: 70.w,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30.h,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: DateTime(1969, 1, 1, 11, 33),
                  onDateTimeChanged: (DateTime newDateTime) {
                    data = newDateTime;
                  },
                  use24hFormat: false,
                  minuteInterval: 1,
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: ButtonWidget(
                  onPressed: (){

                  },
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  hintText: "ESCOLHER",
                  fontWeight: FontWeight.bold,
                  radioButton: 1.h,
                  widthButton: 75.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
