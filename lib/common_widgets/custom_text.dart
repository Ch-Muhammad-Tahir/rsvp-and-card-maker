import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextDecoration? decoration;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final bool? softWrap;
  final TextAlign? textAlign;
  const MyText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.decoration,
      this.fontFamily,
      this.fontWeight,
      this.textOverflow,
      this.maxLines,
      this.softWrap,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        decoration: decoration,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
