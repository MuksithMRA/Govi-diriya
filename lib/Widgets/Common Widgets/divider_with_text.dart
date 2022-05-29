import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/constants/colors.dart';

import 'custom_text.dart';
import 'custome_sizebox.dart';

class DeviderWithText extends StatelessWidget {
  const DeviderWithText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHBox(
          w: 1,
          h: 0.07,
        ),
        Row(
          children: [
            Container(
              height: MediaResponsive().getheight(context) * 0.035,
              width: MediaResponsive().getWidth(context) * 0.02,
              color: kRed,
            ),
            const CustomHBox(
              h: 0,
              w: 0.03,
            ),
            CustomText(
              color: primaryColor,
              text: text,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ],
        ),
        const CustomHBox(
          w: 1,
          h: 0.05,
        ),
      ],
    );
  }
}
