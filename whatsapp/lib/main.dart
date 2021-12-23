import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Login.dart';

void main() {
  runApp(
    ResponsiveSizer(builder: (context, orientation, screentype) {
      return GetMaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        getPages: [
          GetPage(name: "/initialPage", page: () => Login()),
        ],
        initialRoute: "/initialPage",
      );
    }),
  );
}