import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class CustomWeatherIcon extends StatelessWidget {
  const CustomWeatherIcon({
    Key? key,
    required this.day,
    required this.temp,
    required this.imagePath,
  }) : super(key: key);
  final String day;
  final double temp;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(color: kBlack, text: temp.toString()),
        CircleAvatar(
          backgroundColor: primaryColor.withOpacity(0.5),
          backgroundImage: AssetImage(imagePath),
        ),
        CustomText(color: kBlack, text: day),
      ],
    );
  }
}
