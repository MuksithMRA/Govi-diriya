import 'package:flutter/material.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/leaf_button.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/constants/colors.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: CustomAppBar(title: "Reset Password"),
        preferredSize: Size.fromHeight(50),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            width: ScreenSize.width!,
            height: ScreenSize.height! * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: ScreenSize.width! * 0.7,
                    child: Image.asset("assets/reset.jpg")),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.width! * 0.05),
                  child: const CustomText(
                    textAlign: TextAlign.center,
                    color: kBlack,
                    text: "You can recover your Password from here",
                    fontSize: 25,
                  ),
                ),
                const CustomHBox(
                  w: 1,
                  h: 0.04,
                ),
                const CustomTextField(
                  prefixIcon: Icons.call,
                  isPassword: false,
                  labelName: "Phone Number",
                ),
                const CustomHBox(
                  w: 1,
                  h: 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.width! * 0.15),
                  child: WelcomeButtons(
                    title: "Send verification code",
                    route: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
