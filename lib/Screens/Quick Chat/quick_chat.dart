import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Screens/Quick%20Chat/message_card.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';

import 'dart:math' as math;

class QuickChat extends StatelessWidget {
  const QuickChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            elevation: 0,
            title: "Quick Chat",
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaResponsive().getheight(context) * 0.89,
            width: MediaResponsive().getWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaResponsive().getheight(context) * 0.76,
                  width: MediaResponsive().getWidth(context),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return (index % 2) == 0
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: const MessageCard(),
                            )
                          : const MessageCard();
                    },
                  ),
                ),
                SizedBox(
                  height: MediaResponsive().getheight(context) * 0.11,
                  width: MediaResponsive().getWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomTextField(
                        prefixIcon: Icons.mail,
                        isPassword: false,
                        suffixIcon: Icons.send,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
