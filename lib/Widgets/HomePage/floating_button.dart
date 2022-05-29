import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition_slide.dart';
import 'package:govidiriya/Screens/Quick%20Chat/quick_chat.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_floating_button.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFloatingButton(
        bgColor: primaryColor,
        ontap: () {
          Navigator.push(context, SlideTransition1(const QuickChat()));
        },
        label: const CustomText(color: kWhite, text: "Quick Chat"),
        icon: Icons.chat);
  }
}
