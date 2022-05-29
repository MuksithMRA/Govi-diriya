import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';

class CustomFloatingButton extends StatelessWidget {
  final Color bgColor;
  final Color? frColor;
  final VoidCallback ontap;
  final CustomText label;
  final IconData icon;
  const CustomFloatingButton(
      {Key? key,
      required this.bgColor,
      this.frColor,
      required this.ontap,
      required this.label,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: bgColor,
      foregroundColor: frColor,
      onPressed: ontap,
      label: label,
      icon: Icon(
        icon,
      ),
    );
  }
}
