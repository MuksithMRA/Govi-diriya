import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Models/mediaquery.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class CustomMenuCard extends StatelessWidget {
  const CustomMenuCard({
    Key? key,
    required this.screenSize,
    this.route,
    required this.categoryName,
    required this.description,
    required this.imgPath,
    required this.count,
  }) : super(key: key);

  final MediaResponsive screenSize;
  final dynamic route;
  final String categoryName;
  final String description;
  final String imgPath;
  final String count;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, ScaleTransition1(route)); //route
      },
      child: Stack(
        children: [
          Container(
            //color: Colors.blue,
            width: screenSize.getWidth(context) * 0.5,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  //color: kBlack,
                  height: screenSize.getheight(context) * 0.16,
                  width: screenSize.getWidth(context) * 0.6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.getWidth(context) * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          color: Colors.white,
                          text: categoryName,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        CustomText(
                          color: Colors.white,
                          text: description,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(100),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    spreadRadius: 9,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: screenSize.getheight(context) * 0.3,
              width: screenSize.getWidth(context) * 0.5,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: screenSize.getWidth(context) * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenSize.getheight(context) * 0.17,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(imgPath))),
                    width: screenSize.getWidth(context) * 0.2,
                  ),
                  CustomText(
                    text: count,
                    color: Colors.white,
                    fontSize: 20,
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
