import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final VoidCallback onPressed;
  final String title;
  final double? fontSize;
  final Color? fontColor;
  final double? minWidth;
  final double? height;

  CustomButton({
    required this.buttonColor,
    required this.onPressed,
    required this.title,
    this.fontSize,
    this.fontColor,
    this.minWidth,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: fontColor ?? Colors.white,
        minimumSize: Size(88, 36),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize ?? 56.sp,
        ),
      ),
    );
  }
}
