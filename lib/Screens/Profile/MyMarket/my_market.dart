
import 'package:flutter/material.dart';

import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Animations/straggered_list.dart';
import 'package:govidiriya/Models/hero.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Screens/MarketPlace/item_preview.dart';

import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Custom%20Profile%20Widgets/profile_screen_widgets.dart';
import 'package:govidiriya/constants/colors.dart';

class MyMarket extends StatelessWidget {
  const MyMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        backgroundColor: primaryColor,
        onPressed: () {},
        label: const CustomText(
          color: kWhite,
          text: "Add Item",
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          elevation: 0,
          title: "MY MARKET",
          action: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaResponsive().getWidth(context) * 0.05),
              child: const Icon(Icons.shopping_bag),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Align(
            child: Container(
              color: primaryColor,
              height: MediaResponsive().getheight(context),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              height: MediaResponsive().getheight(context) * 0.64,
            ),
          ),
          const ProfileScreenWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaResponsive().getheight(context) * 0.4,
              child: ListView.builder(
                padding: EdgeInsets.only(
                    top: MediaResponsive().getheight(context) * 0.1,
                    left: MediaResponsive().getWidth(context) * 0.08,
                    right: MediaResponsive().getWidth(context) * 0.08),
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
                                  MarketPlaceItemPreview(index: index)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    MediaResponsive().getWidth(context) * 0.35,
                                height: MediaResponsive().getheight(context),
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
                                    MediaResponsive().getWidth(context) * 0.42,
                                height: MediaResponsive().getheight(context),
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      color: kBlack,
                                      text: "Item Name",
                                      fontSize: 22,
                                    ),
                                    const CustomText(
                                      color: kBlack,
                                      text: "Rs 500 per Kg",
                                      fontSize: 18,
                                    ),
                                    RichText(
                                        text: const TextSpan(children: [
                                      WidgetSpan(
                                          child: CircleAvatar(
                                        backgroundColor: primaryColor,
                                        child: Icon(
                                          Icons.shopping_bag,
                                          color: kWhite,
                                        ),
                                      )),
                                      TextSpan(
                                        style: TextStyle(
                                          color: kBlack,
                                          fontSize: 15,
                                        ),
                                        text: "  45",
                                      )
                                    ])),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaResponsive().getheight(context) * 0.05),
                          height: MediaResponsive().getheight(context) * 0.3,
                          width: MediaResponsive().getWidth(context),
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
          )
        ],
      ),
    );
  }
}
