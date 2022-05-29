import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Widgets/CustomStarBar/custom_star.dart';

class CustomStarBar extends StatelessWidget {
  const CustomStarBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaResponsive().getWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Flexible(child: CustomStartButton()),
          Flexible(child: CustomStartButton()),
          Flexible(child: CustomStartButton()),
          Flexible(child: CustomStartButton()),
          Flexible(child: CustomStartButton()),
        ],
      ),
    );
  }
}
