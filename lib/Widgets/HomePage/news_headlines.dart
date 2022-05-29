
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:govidiriya/Models/news.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class NewsHeadlines extends StatelessWidget {
  const NewsHeadlines({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          height: 40.0,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                        ),
                        items: NewsDetails().listOfHeadlines.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Center(
                                  child: CustomText(
                                    textAlign: TextAlign.center,
                                    color: kBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    text: i,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
  }
}