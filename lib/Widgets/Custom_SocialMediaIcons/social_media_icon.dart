import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({Key? key, required this.imgPath}) : super(key: key);

  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: primaryColor,
            content: CustomText(color: kWhite, text: "Coming Soon"),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: kWhite,
          backgroundImage: AssetImage(imgPath),
        ),
      ),
    );
  }
}
