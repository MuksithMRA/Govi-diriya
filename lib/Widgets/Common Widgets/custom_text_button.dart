import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          primary: primaryColor,
        ),
        onPressed: () {},
        child: CustomText(color: kBlack, text: text));
  }
}
