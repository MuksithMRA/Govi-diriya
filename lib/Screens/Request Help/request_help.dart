import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Screens/Help/help.dart';
import 'package:govidiriya/Screens/HomePage/homepage.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:govidiriya/providers/signup_visibility.dart';
import 'package:provider/provider.dart';

class RequestHelp extends StatelessWidget {
  const RequestHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              right: MediaResponsive().getWidth(context) * 0.05,
              left: MediaResponsive().getWidth(context) * 0.05,
              top: MediaResponsive().getheight(context) * 0.08),
          child: SingleChildScrollView(child:
              Consumer<SignupVisibility>(builder: (context, myType, child) {
            return Column(
              children: [
                SizedBox(
                  height: MediaResponsive().getheight(context) * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        fontSize: 35,
                        color: kBlack,
                        text: "Hello ${myType.getName()} !",
                        textAlign: TextAlign.center,
                      ),
                      const CustomText(
                        fontSize: 20,
                        textAlign: TextAlign.center,
                        color: kBlack,
                        text:
                            "If you have any trouble in using this app we are here for you",
                      ),
                      const SizedBox(
                        height: 200,
                        child: Image(
                          image: AssetImage("assets/helpus.jpg"),
                        ),
                      ),
                      const CustomText(
                          fontSize: 20,
                          textAlign: TextAlign.center,
                          color: kBlack,
                          text:
                              "Do you want to refer how to use this app before using?"),
                      const CustomText(
                        fontSize: 18,
                        textAlign: TextAlign.center,
                        color: kBlack,
                        text: "Let's explore some videos",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaResponsive().getWidth(context),
                  height: MediaResponsive().getheight(context) * 0.17,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor,
                              child: MaterialButton(
                                minWidth:
                                    MediaResponsive().getWidth(context) * 0.3,
                                onPressed: () {
                                  Navigator.push(context,
                                      ScaleTransition1(const HomePage()));
                                },
                                child: const CustomText(
                                  text: "Skip",
                                  color: kWhite,
                                ),
                              )),
                          Material(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20),
                              child: MaterialButton(
                                minWidth:
                                    MediaResponsive().getWidth(context) * 0.3,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      ScaleTransition1(const Help(
                                        
                                      )));
                                },
                                child: const CustomText(
                                  text: "Let's See",
                                  color: kWhite,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          })),
        ),
      ),
    );
  }
}
