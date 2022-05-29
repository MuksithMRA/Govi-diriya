
import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/divider_with_text.dart';
import 'package:govidiriya/constants/colors.dart';

class SMSService extends StatelessWidget {
  const SMSService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: CustomAppBar(
          title: "SMS Service",
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaResponsive().getWidth(context) * 0.04,
              vertical: MediaResponsive().getheight(context) * 0.01),
          width: MediaResponsive().getWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: kWhite,
                radius: MediaResponsive().getWidth(context) * 0.35,
                backgroundImage: const AssetImage("assets/sms.jpg"),
              ),
              const CustomHBox(
                w: 1,
                h: 0.02,
              ),
              const CustomText(
                color: kBlack,
                text:
                    "Now you can active daily tips , news and latest methods via SMS. You can simply active this service from clicking subscribe button",
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
              const DeviderWithText(text: "Features"),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaResponsive().getWidth(context) * 0.8,
                  height: MediaResponsive().getheight(context) * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        color: kBlack,
                        text: "Latest News about farming",
                        fontSize: 18,
                      ),
                      const CustomText(
                        color: kBlack,
                        text: "Current Market prices",
                        fontSize: 18,
                      ),
                      const CustomText(
                        color: kBlack,
                        text: "instant buyer Notiications",
                        fontSize: 18,
                      ),
                      const CustomText(
                        color: kBlack,
                        text: "Customer needs",
                        fontSize: 18,
                      ),
                      const CustomText(
                        color: kBlack,
                        text: "App updates and administrator informs",
                        fontSize: 18,
                      ),
                      const CustomHBox(
                        w: 1,
                        h: 0.04,
                      ),
                      SizedBox(
                        width: MediaResponsive().getWidth(context) * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              child: MaterialButton(
                                color: primaryColor,
                                onPressed: () {},
                                child: const CustomText(
                                    color: kWhite, text: "Subscribe Now"),
                              ),
                            ),
                            const CustomText(
                                color: kBlack, text: "Rs 3 + tax  only ")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
