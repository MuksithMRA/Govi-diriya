
import 'package:flutter/material.dart';

import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/divider_with_text.dart';
import 'package:govidiriya/Widgets/HomePage/background_image.dart';
import 'package:govidiriya/Widgets/HomePage/floating_button.dart';
import 'package:govidiriya/Widgets/HomePage/h_appbar.dart';
import 'package:govidiriya/Widgets/HomePage/home_space.dart';
import 'package:govidiriya/Widgets/HomePage/horizontal_menu.dart';
import 'package:govidiriya/Widgets/HomePage/news_headlines.dart';
import 'package:govidiriya/Widgets/HomePage/recent_posts.dart';
import 'package:govidiriya/Widgets/HomePage/user_categorying_counter.dart';
import 'package:govidiriya/Widgets/drawer/drawer.dart';
import 'package:govidiriya/constants/colors.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   // final homeProvider = Provider.of<HomePageProviders>(context, listen: false);

    return Scaffold(
        floatingActionButton: const FloatingButton(),
        drawer: const CustomDrawer(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: HomeAppBar(),
        ),
        body: Stack(
          children: [
            const BackgroundImage(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(
                    top: ScreenSize.width! * 0.03,
                    right: ScreenSize.width! * 0.02,
                    left: ScreenSize.width! * 0.02),

                //Vertical  List begin
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: const [
                      DeviderWithText(text: "News Headlines"),
                      NewsHeadlines(),
                      DeviderWithText(text: "Counter"),
                      UserCategoryingCounter(),
                      DeviderWithText(text: "Menu"),
                      HorizontalMenu(),
                      DeviderWithText(text: "Recent Posts"),
                      RecentPosts(),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: primaryColor,
                    width: 3,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: ScreenSize.height! * 0.63,
                width: ScreenSize.width!,
              ),
            ),
            const HomeSpace(),
          ],
        ));
  }
}
