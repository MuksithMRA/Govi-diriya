import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/constants/colors.dart';

import '../CustomStarBar/custom_star.dart';
import '../Common Widgets/custom_text.dart';
import '../Common Widgets/custome_sizebox.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  Map profileData = {};

  @override
  void initState() {
    getdocuments();
    super.initState();
  }

  getdocuments() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser!.uid)
        .get()
        .then((value) {
      setState(() {
        profileData = value.data()!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.topCenter,
        height: MediaResponsive().getheight(context) * 0.74,
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: kWhite,
              backgroundImage: AssetImage("assets/profile.png"),
              radius: 65,
              foregroundColor: kWhite,
            ),
            const CustomHBox(
              w: 1,
              h: 0.04,
            ),
            CustomText(
              fontWeight: FontWeight.bold,
              color: kBlack,
              text:
                  "${profileData["first_name"] ?? "Loading .."} ${profileData["last_name"] ?? ""}"
                      .toUpperCase(),
              fontSize: 20,
            ),
            const CustomHBox(
              w: 1,
              h: 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomStartButton(),
                CustomStartButton(),
                CustomStartButton(),
                CustomStartButton(),
                CustomStartButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
