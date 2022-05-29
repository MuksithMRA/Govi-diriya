import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/Widgets/MarketPlace/marketplace_list.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/constants/colors.dart';

class Harvest extends StatelessWidget {
  const Harvest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: CustomAppBar(
          
          elevation: 0,
          title: "Harverst Market",
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaResponsive().getheight(context) * 0.18,
              width: MediaResponsive().getWidth(context),
              decoration: const BoxDecoration(
                //  image: DecorationImage(
                //     image: NetworkImage(
                //         "https://images.unsplash.com/photo-1558906307-1a1c52b5ac8a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmVydGlsaXplcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                //   ),
                color: primaryColor,
              ),
            ),
          ),
          const MarketPlaceList(num: 2,reverse: true,),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextField(
                    height: MediaResponsive().getheight(context) * 0.09,
                    hintText: "Search",
                    prefixIcon: Icons.search,
                    isPassword: false,
                    suffixIcon: Icons.arrow_forward,
                  ),
                ],
              ),
              height: MediaResponsive().getheight(context) * 0.24,
              width: MediaResponsive().getWidth(context),
              decoration: const BoxDecoration(
                  //  image: DecorationImage(
                  //     image: NetworkImage(
                  //         "https://images.unsplash.com/photo-1558906307-1a1c52b5ac8a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmVydGlsaXplcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                  //   ),

                  ),
            ),
          ),
        ],
      ),
    );
  }
}
