import 'package:flutter/material.dart';

import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/constants/colors.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({
    Key? key,
    required this.title,
    this.route,
  }) : super(key: key);

  final String title;
  final dynamic route;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: MaterialButton(
        minWidth: MediaResponsive().getWidth(context),
        height: 60,
        onPressed: route,
        color: primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
