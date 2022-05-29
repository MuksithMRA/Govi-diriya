// ignore_for_file: unnecessary_new


import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/straggered_list.dart';
import 'package:govidiriya/Models/hero.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:shimmer_image/shimmer_image.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          elevation: 0,
          title: "News",
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return CustomStaggeredList(
            index: index,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: const Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: myDetailsContainer(
                          "News Heading",
                          "2021 -02 -15",
                        ),
                      ),
                      SizedBox(
                        width: MediaResponsive().getWidth(context) * 0.3,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                          child: ProgressiveImage(
                            
                            width: MediaResponsive().getWidth(context) * 0.3,
                            image: HeroImage().listOfImages1[index],
                            height: 200.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}

Widget myDetailsContainer(String newsHeadline, String date) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: CustomText(
          color: kBlack,
          text: newsHeadline,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          const Icon(Icons.timer),
          CustomText(
            color: Colors.black54,
            text: date,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ],
      ),
    ],
  );
}
