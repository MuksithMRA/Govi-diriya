import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/Profile/profile_main_screen.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "",
      action: [
        Container(
          decoration: BoxDecoration(
              color: secondryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )),
          width: ScreenSize.width! * 0.35,
          child: InkWell(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            onTap: () {
              Navigator.push(
                  context, ScaleTransition1(const ProfileMainScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CustomText(color: Colors.white, text: "My Profile"),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.png"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
