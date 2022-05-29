import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.color,
    this.fontSize,
    this.fontWeight,
    this.letterspacing,
    this.shadow,
    required this.text,
    this.textAlign,
  }) : super(key: key);

  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterspacing;
  final dynamic shadow;
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.visible,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterspacing,
        shadows: shadow,
      ),
      textAlign: textAlign,
    );
  }
}
