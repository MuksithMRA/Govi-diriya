import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/constants/colors.dart';

SnackBar customSnackBar(String message,IconData icon,Color bgColor) {
  return SnackBar(
    action: SnackBarAction(
        label: "Close",
        textColor: kWhite,
        onPressed: () {
          SnackBarClosedReason.hide;
        }),
    content: Row(
      children: [
        Icon(
          icon,
          color: kWhite,
        ),
        const CustomHBox(
          h: 0,
          w: 0.02,
        ),
        CustomText(
          text: message,
          color: kWhite,
        ),
      ],
    ),
    backgroundColor: bgColor,
  );
}
