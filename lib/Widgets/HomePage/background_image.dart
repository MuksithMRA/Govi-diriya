import 'package:flutter/material.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Widgets/CustomHomeWidgets/weather_card.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: const WeatherCard(), //Weather card

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Homebg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        height: ScreenSize.height! * 0.4,
        width: ScreenSize.width!,
      ),
    );
  }
}
