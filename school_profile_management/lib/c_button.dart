import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CButton extends StatelessWidget {
  final VoidCallback? buttonTapped;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final String? title;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final double? radius;
  final Color? borderColor;
  final EdgeInsets? pin;
  final EdgeInsets? margin;
  final String? fontFamily;

  const CButton({
    Key? key,
    this.buttonTapped,
    this.backgroundColor,
    this.title,
    this.radius,
    this.borderColor,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.height,
    this.width,
    this.pin,
    this.margin,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pin ?? const EdgeInsets.all(0),
      child: Container(
        height: height ?? 32,
        width: width ?? 40,
        margin: margin ?? const EdgeInsets.all(0),
        child: TextButton(
          onPressed: buttonTapped,
          child: Center(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: titleFontSize ?? 14.sp,
                color: titleColor ?? Colors.black,
                fontWeight: titleFontWeight ?? FontWeight.normal,
              ),
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 0.0),
                side: BorderSide(color: borderColor ?? Colors.transparent)),
          ),
        ),
      ),
    );
  }
}
