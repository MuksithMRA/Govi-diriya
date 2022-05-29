import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govidiriya/Screens/Profile/AboutMe/about_me.dart';
import 'package:govidiriya/Screens/Profile/Gallery/gallery.dart';
import 'package:govidiriya/Screens/Profile/MyMarket/my_market.dart';
import 'package:govidiriya/constants/colors.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  ProfileMainScreenState createState() => ProfileMainScreenState();
}

class ProfileMainScreenState extends State<ProfileMainScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          color: Colors.red,
          child: listOfRoutes[currentIndex],
        ));
  }

  List<IconData> listOfIcons = [
    Icons.person,
    Icons.photo,
    Icons.shopping_bag,
  ];

  List<String> listOfTitles = [
    'About Me',
    'Gallery',
    'My Market',
  ];
  List<dynamic> listOfRoutes = [
    const Aboutme(),
    const ProfileGallery(),
    const MyMarket(),
  ];
}
