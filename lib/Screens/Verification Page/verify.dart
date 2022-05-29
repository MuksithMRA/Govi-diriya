
import 'package:flutter/material.dart';

import 'package:govidiriya/Animations/page_transition_slide.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Screens/Personal%20Details/personal_details.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/leaf_button.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:govidiriya/constants/fonts.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({Key? key}) : super(key: key);

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: CustomAppBar(
          elevation: 0,
          title: "Verify your Number",
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaResponsive().getWidth(context) * 0.08),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                color: kBlack,
                text: "We sent you a code",
                fontSize: 25,
              ),
              Text(
                "verify it's you",
                style: secondaryStyle(
                    15, FontWeight.normal, kBlack, FontStyle.normal),
              ),
              const CustomHBox(
                h: 0.05,
                w: 1,
              ),
              const CustomTextField(
                prefixIcon: Icons.password,
                isPassword: false,
                labelName: "Code",
              ),
              const CustomHBox(
                h: 0.02,
                w: 1,
              ),
              const CustomText(
                  color: kBlack, text: "Code will recieve within 2 minutes."),
              const CustomText(color: kBlack, text: "Please be patient"),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(primaryColor),
                ),
                onPressed: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: CustomText(
                  color: isClicked ? kWhite : kBlack,
                  text: "Resent code",
                ),
              ),
              WelcomeButtons(
                  title: "Verify now",
                  route: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      SlideTransition1(const PersonalDetails()),
                      (Route<dynamic> route) => false,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
