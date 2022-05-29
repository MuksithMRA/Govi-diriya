import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Animations/straggered_list.dart';
import 'package:govidiriya/Models/hero.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/Read%20and%20Write/item_preview.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:shimmer_image/shimmer_image.dart';

class RecentPosts extends StatelessWidget {
  const RecentPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: ScreenSize.width!,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return CustomStaggeredList(
            index: index,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                
                elevation: 5,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context, ScaleTransition1(ReaderItems(index: index)));
                  },
                  child: SizedBox(
                   
                    height: ScreenSize.height! * 0.3,
                   
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            child: ProgressiveImage(
                              fit: BoxFit.cover,
                              image: HeroImage().listOfImages[index],
                              width: MediaResponsive().getWidth(context),
                              height: 160,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: ScreenSize.width,
                            color: const Color(0xffecf0f1),
                            child: const Center(
                              child: CustomText(
                                color: kBlack,
                                text: "This is Article Heading",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                width: ScreenSize.width,
                                color: const Color(0xffecf0f1),
                                child: const Center(
                                  child: CustomText(
                                      color: kBlack, text: "Written by : Whom"),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
