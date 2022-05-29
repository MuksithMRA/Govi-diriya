import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Animations/straggered_list.dart';
import 'package:govidiriya/Models/hero.dart';

import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/Farming%20Information/info_item_preview.dart';


import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/constants/colors.dart';

class FarmingInfoList extends StatelessWidget {
  const FarmingInfoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _cardHeadings = [
      "Usefull Contact Details",
      "Agriculture Head Office",
      "Events for farmers",
      "Agriculture degree details",
      "Best Advices from Agriculture specialist",
    ];
    return SizedBox(
      height: ScreenSize.height!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: ScreenSize.height! * 0.7,
              child: ListView.builder(
                padding: EdgeInsets.only(
                    top: ScreenSize.height! * 0.1,
                    left: ScreenSize.width! * 0.08,
                    right: ScreenSize.width! * 0.08),
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return CustomStaggeredList(
                      index: index,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            ScaleTransition1(
                              InfoItemPreview(index: index),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    ScreenSize.width! * 0.35,
                                height: ScreenSize.height!,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      HeroImage().listOfImages[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    ScreenSize.width! * 0.42,
                                height: ScreenSize.height!,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      color: kBlack,
                                      text: _cardHeadings[index],
                                      fontSize: 22,
                                    ),
                                    Row(
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
                                            color: kBlack,
                                            text: "2021 - 10 - 01"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(
                              bottom:
                                  ScreenSize.height! * 0.05),
                          height: ScreenSize.height! * 0.3,
                          width: ScreenSize.width!,
                          decoration: BoxDecoration(color: kWhite, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 7,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
