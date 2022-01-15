import 'package:flutter/material.dart';

class CContainer extends StatefulWidget {
  final Color? backgroundColor;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? tappedContainer;

  const CContainer(
      {Key? key,
      this.backgroundColor,
      this.radius,
      this.borderColor,
      this.borderWidth,
      this.height,
      this.width,
      this.child,
      this.tappedContainer,
      this.padding,
      this.margin})
      : super(key: key);

  @override
  _JContainerState createState() => _JContainerState();
}

class _JContainerState extends State<CContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tappedContainer,
      child: Container(
        margin: widget.margin ?? const EdgeInsets.all(0),
        padding: widget.padding ?? const EdgeInsets.all(0),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(widget.radius ?? 0.0),
          border: Border.all(
            color: widget.borderColor ?? Colors.white,
            width: widget.borderWidth ?? 0.0,
          ),
        ),
        child: widget.child ?? Container(),
      ),
    );
  }
}
