import 'package:flutter/material.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/Farming%20Information/farming_info_list.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/constants/colors.dart';

class FarmingInfo extends StatelessWidget {
  const FarmingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: CustomAppBar(
          elevation: 0,
          title: "Farming Information",
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: Stack(
        children: [
          const FarmingInfoList(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: ScreenSize.height! * 0.18,
              width: ScreenSize.width!,
              decoration: const BoxDecoration(
                //  image: DecorationImage(
                //     image: NetworkImage(
                //         "https://images.unsplash.com/photo-1558906307-1a1c52b5ac8a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmVydGlsaXplcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                //   ),
                color: primaryColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextField(
                    height: ScreenSize.height! * 0.09,
                    hintText: "Search",
                    prefixIcon: Icons.search,
                    isPassword: false,
                    suffixIcon: Icons.arrow_forward,
                  ),
                ],
              ),
              height: ScreenSize.height! * 0.24,
              width: ScreenSize.width!,
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
