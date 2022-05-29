

import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';

import 'package:govidiriya/Models/mediaquery.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/leaf_button.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:provider/provider.dart';

import '../Login/login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // bool _isConnected = false;
  // Future<void> _checkInternetConnection() async {
  //   try {
  //     final response = await InternetAddress.lookup('www.google.com');
  //     if (response.isNotEmpty) {
  //       setState(() {
  //         _isConnected = true;
  //       });
  //     }
  //   } on SocketException catch (err) {
  //     setState(() {
  //       _isConnected = false;
  //     });
  //     print(err);
  //   }
  // }

  // @override
  // void initState() {
  //   _checkInternetConnection();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
  
    final screenSize = Provider.of<MediaResponsive>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.getWidth(context),
          // height: screenSize.getheight(context),
          padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Govidiriya Online Service ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.8,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/welcome.gif"))),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  const CustomText(
                    color: kBlack,
                    text: "Choose a Language",
                    fontSize: 20,
                  ),
                  const SizedBox(height: 20),
                  // the login button
                  WelcomeButtons(title: "සිංහල   🔒", route: () {}),
                  // creating the signup button
                  const SizedBox(height: 20),
                  WelcomeButtons(
                      title: "English",
                      route: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          ScaleTransition1(const LoginPage()),
                          (Route<dynamic> route) => false,
                        );
                      }),
                  const SizedBox(height: 20),
                  WelcomeButtons(title: "தமிழ்   🔒", route: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
