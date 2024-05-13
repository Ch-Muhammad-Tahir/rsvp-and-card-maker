import 'package:flutter/material.dart';
import '../common_widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final FontWeight fontWeight;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor = Colors.lightBlue,
    this.fontSize = 24,
    this.width,
    this.fontWeight = FontWeight.w500,
    this.textColor = Colors.white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Material(
      //olor: Colors.black,
      borderOnForeground: false,
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
          width: width ?? MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(15)),
          child: MyText(
            text: text,
            fontSize: fontSize,
            textAlign: TextAlign.center,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
