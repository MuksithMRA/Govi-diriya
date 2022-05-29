import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.action,
      this.leading,
      this.elevation, this.appbarColour})
      : super(key: key);
  final String title;
  final List<Widget>? action;
  final Widget? leading;
  final double? elevation;
  final Color? appbarColour;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      leading: leading,
      centerTitle: true,
      title: CustomText(color: kWhite, text: title),
      backgroundColor: appbarColour ?? primaryColor,
      actions: action,
    );
  }
}
