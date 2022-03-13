import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ButtonLoadingWidget extends StatelessWidget {
  final String? hintText;
  final double? heightButton;
  final double? widthButton;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;
  final Color? valueColor;
  final Color? successColor;
  final RoundedLoadingButtonController controller;
  final double? loaderSize;
  final double? loaderStrokeWidth;
  final Function()? onPressed;

  const ButtonLoadingWidget(
      {Key? key,
        this.hintText,
        this.heightButton,
        this.widthButton,
        this.borderRadius,
        this.textColor,
        this.onPressed,
        this.color,
        this.loaderSize,
        this.loaderStrokeWidth,
        this.valueColor,
        required this.controller,
        this.successColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      height: heightButton ?? 5.5.h,
      width: widthButton ?? 25.w,
      onPressed: onPressed,
      loaderSize: loaderSize ?? 3.h,
      loaderStrokeWidth: loaderStrokeWidth ?? 4,
      color: color ?? Colors.white,
      successColor: successColor ?? Colors.green,
      borderRadius: borderRadius ?? 2.h,
      valueColor: valueColor ?? Colors.white,
      controller: controller,
      child: Text(
        hintText ?? "",
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 2.h,
        ),
      ),
    );
  }
}