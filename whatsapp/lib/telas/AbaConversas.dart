import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AbaConversas extends StatefulWidget {
  const AbaConversas({Key? key}) : super(key: key);

  @override
  _AbaConversasState createState() => _AbaConversasState();
}

class _AbaConversasState extends State<AbaConversas> {
  bool _hasPicture = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.all(2.h),
          child: Row(
            children: [
              Container(
                height: 8.h,
                width: 8.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.h),
                  color: Color(0XFF096A63),
                ),
                child: _hasPicture ?
                  Image.asset(
                      ""
                  ) :
                  Center(
                    child: Text(
                      "WD",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
              ),
            ],
          ),
        );
      },
    );
  }
}
