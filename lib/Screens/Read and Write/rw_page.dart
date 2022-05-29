
import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Animations/straggered_list.dart';
import 'package:govidiriya/Models/hero.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Screens/Read%20and%20Write/item_preview.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/constants/colors.dart';

class ReadAndWrite extends StatelessWidget {
  const ReadAndWrite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        backgroundColor: primaryColor,
        onPressed: () {},
        label: const CustomText(
          color: kWhite,
          text: "Add Post",
        ),
      ),
      appBar: const PreferredSize(
        child: CustomAppBar(
          elevation: 0,
          title: "Read and Write",
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: primaryColor,
              height: MediaResponsive().getheight(context) * 0.3,
              width: MediaResponsive().getWidth(context),

              // child: const Image(
              //   image: AssetImage("assets/Green_Book.jpg"),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaResponsive().getheight(context) * 0.8,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaResponsive().getWidth(context) * 0.05),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return CustomStaggeredList(
                    index: index,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          ScaleTransition1(
                            ReaderItems(index: index),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: MediaResponsive().getheight(context) * 0.3,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            HeroImage().listOfImages[index]),
                                        fit: BoxFit.cover),
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: MediaResponsive().getWidth(context),
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
                                width: MediaResponsive().getWidth(context),
                                color: const Color(0xffecf0f1),
                                child: const Center(
                                  child: CustomText(
                                      color: kBlack, text: "Written by : Whom"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
