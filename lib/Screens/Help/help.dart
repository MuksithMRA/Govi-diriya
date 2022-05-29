
import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/straggered_list.dart';

import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/HomePage/homepage.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/constants/colors.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _listOfThumbnails = ["assets/help.gif"];
    List<String> _listOfHelps = [
      "How to use app",
      "How to add post",
      "How to subscribe sms service",
      "How to buy an item",
      "what is the purpose of this app"
    ];
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return const HomePage();
        }));
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () {},
          label: const CustomText(color: kWhite, text: "Call us"),
          icon: const Icon(Icons.call),
        ),
        appBar: const PreferredSize(
          child: CustomAppBar(
            title: "Help",
          ),
          preferredSize: Size.fromHeight(50),
        ),
        body: Column(
          children: [
            const CustomHBox(
              h: 0.03,
              w: 1,
            ),
            SizedBox(
              width: ScreenSize.width! * 0.3,
              height: ScreenSize.height! * 0.2,
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/pp.jpg"),
              ),
            ),
            CustomText(
              color: kBlack,
              text: "We are INVICTUS".toUpperCase(),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const CustomHBox(
              w: 1,
              h: 0.03,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width! * 0.05),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return CustomStaggeredList(
                    index: index,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWhite,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    5, 7), // changes position of shadow
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            )),
                        child: Column(
                          children: [
                            Container(
                              color: kWhite,
                              child: Image.asset(_listOfThumbnails[0]),
                              height: 200,
                            ),
                            Container(
                              color: kWhite,
                              child: CustomText(
                                color: kBlack,
                                text: _listOfHelps[index],
                                fontSize: 19,
                              ),
                            ),
                            const CustomHBox(h: 0.02, w: 1),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
