
import 'package:flutter/material.dart';

import 'package:govidiriya/Models/hero.dart';

import 'package:govidiriya/Models/screen_size.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/constants/colors.dart';

class InfoItemPreview extends StatelessWidget {
  const InfoItemPreview({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    List<String> _cardHeadings = [
      "Usefull Contact Details",
      "Agriculture Head Office",
      "Events for farmers",
      "Agriculture degree details",
      "Best Advices from Agriculture specialist",
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        tooltip: "Report",
        onPressed: () {},
        child: const Icon(Icons.report),
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
              height: ScreenSize.height! * 0.5,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: ScreenSize.height!,
              width: ScreenSize.width!,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: ScreenSize.height! * 0.05,
                        left: ScreenSize.width! * 0.05,
                        right: ScreenSize.width! * 0.05),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            color: kBlack,
                            text: _cardHeadings[index],
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          const CustomHBox(
                            w: 1,
                            h: 0.02,
                          ),
                          SizedBox(
                            width: ScreenSize.width!,
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                  child: Icon(
                                    Icons.timer,
                                    color: kWhite,
                                    size: 15,
                                  ),
                                ),
                                CustomHBox(
                                  h: 0,
                                  w: 0.03,
                                ),
                                CustomText(
                                    color: kBlack, text: "2021 - 10 - 01"),
                              ],
                            ),
                          ),
                          const CustomHBox(
                            h: 0.05,
                            w: 1,
                          ),
                          Row(
                            children: [
                              Container(
                                color: primaryColor,
                                height: 19,
                                width: 7,
                              ),
                              const CustomHBox(
                                h: 0,
                                w: 0.02,
                              ),
                              const CustomText(
                                color: kBlack,
                                text: "Content",
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
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
                                    color: kWhite,
                                    text: "Report or additional details"),
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
                    height: ScreenSize.height! * 0.55,
                    width: ScreenSize.width!,
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
