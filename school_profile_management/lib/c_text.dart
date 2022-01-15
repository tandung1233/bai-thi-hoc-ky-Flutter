import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CText extends StatefulWidget {
  final double? width;
  final GestureTapCallback? tappedText;
  final String? text;
  final EdgeInsets? pin;
  final EdgeInsets? margin;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? backgrounColor;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final double? lineSpacing;
  final TextOverflow? textOverflow;
  final int? maxLines;

  const CText({
    Key? key,
    this.textOverflow,
    this.text,
    this.pin,
    this.margin,
    this.textColor,
    this.fontWeight,
    this.maxLines,
    this.fontSize,
    this.textAlign,
    this.backgrounColor,
    this.textDecoration,
    this.tappedText,
    this.width,
    this.fontFamily,
    this.lineSpacing,
  }) : super(key: key);

  @override
  _JTextState createState() => _JTextState();
}

class _JTextState extends State<CText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tappedText,
      child: Container(
        width: widget.width,
        padding: widget.pin ?? const EdgeInsets.all(0),
        margin: widget.margin ?? const EdgeInsets.all(0),
        child: Text((widget.text ?? ''),
            textAlign: widget.textAlign ?? TextAlign.left,
            style: TextStyle(
              fontFamily: widget.fontFamily ?? 'Roboto-Regular',
              height: widget.lineSpacing ?? 1,
              decoration: widget.textDecoration ?? TextDecoration.none,
              backgroundColor: widget.backgrounColor ?? Colors.transparent,
              fontWeight: widget.fontWeight ?? FontWeight.normal,
              color: widget.textColor ?? Colors.black,
              fontSize: widget.fontSize ?? 14.sp,
            ),
            overflow: widget.textOverflow,
            maxLines: widget.maxLines),
      ),
    );
  }
}
