

import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Animations/page_transition_slide.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Models/user_data.dart';
import 'package:govidiriya/Screens/Login/login.dart';
import 'package:govidiriya/Service/auth.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/snack_bar.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Custom%20Profile%20Widgets/profile_screen_widgets.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:provider/provider.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({Key? key}) : super(key: key);

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
  final AuthService _auth = AuthService();
 
  @override
  Widget build(BuildContext context) {
      final _userData = Provider.of<UserData>(context, listen: false);
    final List _listOfIcons = <IconData>[
      Icons.email,
      Icons.call,
      Icons.male,
      Icons.home,
      Icons.agriculture,
    ];
    final List _listOfLabels = <Widget>[
      const CustomText(color: kBlack, text: "Email"),
      const CustomText(color: kBlack, text: "Phone Number"),
      const CustomText(color: kBlack, text: "Gender"),
      const CustomText(color: kBlack, text: "Address"),
      const CustomText(color: kBlack, text: "Category"),
    ];
    final List _listOfSubtitles = <Widget>[
      CustomText(color: kBlack, text: _userData.getEmail),
      CustomText(color: kBlack, text: _userData.getPhone),
      CustomText(color: kBlack, text: _userData.getGender),
      CustomText(color: kBlack, text: _userData.getAddress),
      CustomText(color: kBlack, text: _userData.getCategories),
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.person_add),
          backgroundColor: primaryColor,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                "This feature will Update soon", Icons.update, primaryColor));

            // Navigator.push(
            //     context,
            //     SlideTransition1(UpdateUserData(
            //       fname: profileData['first_name'].toString(),
            //       lname: profileData['last_name'].toString(),
            //       gender: profileData['Gender'].toString(),
            //       role: profileData['Role'].toString(),
            //       email: profileData['Email'].toString(),
            //       address: profileData['Address'].toString(),
            //       pNo: profileData['phone'].toString(),
            //     )));
          },
          label: const CustomText(
            color: kWhite,
            text: "Edit Profile",
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            elevation: 0,
            title: "MY PROFILE",
            action: [
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    ScaleTransition1(const LoginPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Row(
                  children: [
                    const CustomText(color: kWhite, text: "Logout"),
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () async {
                        await _auth.signOut();

                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                                "Log out Success", Icons.done, primaryColor));
                        Navigator.pushAndRemoveUntil(
                          context,
                          SlideTransition1(const LoginPage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Align(
              child: Container(
                color: primaryColor,
                height: MediaResponsive().getheight(context),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffecf0f1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                height: MediaResponsive().getheight(context) * 0.64,
              ),
            ),
            const ProfileScreenWidget(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.topCenter,
                height: MediaResponsive().getheight(context) * 0.41,
                child: Container(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: primaryColor,
                          child: Icon(
                            _listOfIcons[index],
                            color: kWhite,
                          ),
                        ),
                        title: _listOfLabels[index],
                        subtitle: _listOfSubtitles[index],
                      );
                    },
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: kWhite,
                  ),
                  margin: EdgeInsets.only(
                    top: MediaResponsive().getheight(context) * 0.01,
                    left: MediaResponsive().getWidth(context) * 0.05,
                    right: MediaResponsive().getWidth(context) * 0.05,
                  ),
                  padding: EdgeInsets.only(
                    top: MediaResponsive().getheight(context) * 0.01,
                    left: MediaResponsive().getWidth(context) * 0.05,
                    right: MediaResponsive().getWidth(context) * 0.05,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
