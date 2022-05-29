import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';

class CustomHBox extends StatelessWidget {
  const CustomHBox({Key? key, this.h, this.w}) : super(key: key);
  final num? h;
  final num? w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaResponsive().getheight(context)*h!,
      width: MediaResponsive().getWidth(context)*w!,
    );
  }
}
