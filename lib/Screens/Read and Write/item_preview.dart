
import 'package:flutter/material.dart';

import 'package:govidiriya/Models/hero.dart';
import 'package:govidiriya/Models/mediaquery.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/constants/colors.dart';

class ReaderItems extends StatelessWidget {
  const ReaderItems({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        tooltip: "Call",
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    HeroImage().listOfImages[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaResponsive().getheight(context) * 0.35,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaResponsive().getheight(context),
              width: MediaResponsive().getWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaResponsive().getheight(context) * 0.05,
                        left: MediaResponsive().getWidth(context) * 0.05,
                        right: MediaResponsive().getWidth(context) * 0.05),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            color: kBlack,
                            text: "This is a Article Heading",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          const CustomHBox(
                            w: 1,
                            h: 0.02,
                          ),
                          SizedBox(
                            width: MediaResponsive().getWidth(context),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Row(
                                    children: const [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/profile.png"),
                                      ),
                                      CustomHBox(
                                        h: 0,
                                        w: 0.03,
                                      ),
                                      CustomText(
                                        color: kBlack,
                                        text: "M.H siripala",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                const Flexible(
                                  child: CustomText(
                                    color: kBlack,
                                    text: "Posted date :  2021-07-05",
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const CustomHBox(
                            h: 0.03,
                            w: 1,
                          ),
                          const CustomText(
                            color: kBlack,
                            text:
                                "ontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 ",
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                          const CustomHBox(
                            h: 0.03,
                            w: 1,
                          ),
                          Material(
                              borderRadius: BorderRadius.circular(30),
                              color: primaryColor,
                              child: MaterialButton(
                                onPressed: () {},
                                child: const CustomText(
                                    color: kWhite, text: "Report or Feedback"),
                              )),
                          const CustomHBox(
                            h: 0.03,
                            w: 1,
                          ),
                        ],
                      ),
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: Color(0xffecf0f1)),
                    height: MediaResponsive().getheight(context) * 0.75,
                    width: MediaResponsive().getWidth(context),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
