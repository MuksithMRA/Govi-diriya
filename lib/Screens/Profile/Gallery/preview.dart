import 'package:flutter/material.dart';
import 'package:govidiriya/Models/hero.dart';
import 'package:govidiriya/Models/mediaquery.dart';

class MediaPreview extends StatelessWidget {
  const MediaPreview({Key? key, required this.currentIndex}) : super(key: key);
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    HeroImage heroItem = HeroImage();
    return Scaffold(
      body: SizedBox(
          height: MediaResponsive().getheight(context),
          child:  Hero(
            tag: heroItem.heroTags[currentIndex],
            child: Image(
              image: NetworkImage(heroItem.listOfImages[currentIndex]),
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}
