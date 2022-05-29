import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/Custom_SocialMediaIcons/social_media_icon.dart';

class SocialMediaIconBar extends StatelessWidget {
  const SocialMediaIconBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        SocialMediaIcon(imgPath: "assets/google.png"),
        SocialMediaIcon(imgPath: "assets/fb.png"),
        SocialMediaIcon(imgPath: "assets/apple.png")
      ],
    );
  }
}
