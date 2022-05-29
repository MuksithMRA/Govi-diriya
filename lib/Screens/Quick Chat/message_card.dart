import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/constants/colors.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaResponsive().getWidth(context) * 0.08,
                vertical: MediaResponsive().getheight(context) * 0.03),
            child: Container(
              width: MediaResponsive().getWidth(context) * 0.8,
              height: MediaResponsive().getheight(context) * 0.09,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        const Flexible(
            child: CircleAvatar(
          backgroundImage: AssetImage("assets/profile.png"),
          radius: 30,
        )),
      ],
    );
  }
}
