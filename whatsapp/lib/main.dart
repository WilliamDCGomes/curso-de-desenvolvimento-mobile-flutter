import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Home.dart';
import 'Login.dart';

void main() {
  runApp(
    ResponsiveSizer(builder: (context, orientation, screentype) {
      return MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
      );
    }),
  );
}