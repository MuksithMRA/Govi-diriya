
import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Animations/page_transition_slide.dart';
import 'package:govidiriya/Models/user_data.dart';
import 'package:govidiriya/Screens/Profile/profile_main_screen.dart';
import 'package:govidiriya/Screens/Farming%20Information/farming_info.dart';

import 'package:govidiriya/Screens/Help/help.dart';
import 'package:govidiriya/Screens/HomePage/homepage.dart';
import 'package:govidiriya/Screens/MarketPlace/market_place.dart';
import 'package:govidiriya/Screens/Login/login.dart';
import 'package:govidiriya/Screens/News/news.dart';
import 'package:govidiriya/Screens/Read%20and%20Write/rw_page.dart';
import 'package:govidiriya/Screens/SMS%20Service/sms_service.dart';
import 'package:govidiriya/Service/auth.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/snack_bar.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final _userData = Provider.of<UserData>(context, listen: false);
    print(_userData.getAddress);
    final List<IconData> _listOfIcons = [
      Icons.home,
      Icons.sms,
      Icons.shopping_bag,
      Icons.info,
      Icons.book,
      Icons.article,
      Icons.help_center,
      Icons.logout,
    ];

    final List<String> _listOfLabels = [
      "Home",
      "SMS Service",
      "Market Place",
      "Farming Information",
      "Read and Write",
      "News",
      "Help",
      "Logout",
    ];
    final List<dynamic> _listOfNavigations = [
      const HomePage(),
      const SMSService(),
      const MarketPlace(),
      const FarmingInfo(),
      const ReadAndWrite(),
      const News(),
      const Help(),
      const LoginPage(),
    ];
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    ScaleTransition1(
                      const ProfileMainScreen(),
                    ),
                  );
                },
                child: const Image(image: AssetImage("assets/profile.png"))),
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            accountName: CustomText(
                color: Colors.white,
                text: _userData.getFname + " " + _userData.getLname),
            accountEmail:
                CustomText(color: Colors.white, text: _userData.getEmail),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 8,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: kBlack,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Icon(
                      _listOfIcons[index],
                      color: kWhite,
                    ),
                  ),
                  title: CustomText(color: kBlack, text: _listOfLabels[index]),
                  onTap: () async {
                    if (index == 7) {
                      await _auth.signOut();

                      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                          "Log out Success", Icons.done, primaryColor));
                      Navigator.pushAndRemoveUntil(
                        context,
                        SlideTransition1(_listOfNavigations[index]),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      Navigator.push(
                        context,
                        ScaleTransition1(_listOfNavigations[index]),
                      );
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
