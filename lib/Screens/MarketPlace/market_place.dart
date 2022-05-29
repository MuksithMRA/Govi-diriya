import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govidiriya/Screens/MarketPlace/Fertilizer/fertilizer.dart';
import 'package:govidiriya/Screens/MarketPlace/Harvest/harvest.dart';
import 'package:govidiriya/Screens/MarketPlace/Utills/utills.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  MarketPlaceState createState() => MarketPlaceState();
}

class MarketPlaceState extends State<MarketPlace> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () {},
          label: const CustomText(color: kWhite, text: "Filter"),
          icon: const Icon(Icons.filter_alt),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              bottom: _width * .05,
              left: _width * .05,
              right: _width * .05,
              top: .02),
          height: _height * 0.08,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 32,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: _width * .02),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex ? _width * .42 : _width * .23,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? _height * .065 : 0,
                      width: index == currentIndex ? _width * .42 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.cyan.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex ? _width * .40 : _width * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex ? _width * .13 : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? listOfTitles[index]
                                    : '',
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex ? _width * .03 : 20,
                            ),
                            Icon(
                              listOfIcons[index],
                              size: _width * .076,
                              color: index == currentIndex
                                  ? primaryColor
                                  : Colors.black26,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: listOfRoutes[currentIndex],
        ));
  }

  List<IconData> listOfIcons = [
    Icons.shopping_bag,
    Icons.account_tree,
    Icons.accessibility,
  ];

  List<String> listOfTitles = [
    'Fertilizers',
    'Harvest',
    'Utilities',
  ];
  List<dynamic> listOfRoutes = [
    const Fertilizer(),
    const Harvest(),
    const Utills(),
  ];
}
