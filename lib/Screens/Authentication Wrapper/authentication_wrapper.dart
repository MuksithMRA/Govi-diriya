// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:govidiriya/Models/user.dart';
import 'package:govidiriya/Screens/Welcome%20Page/welcome_page.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/get_user_data.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //debugPrint( Provider.of<UserData>(context , listen: false).getId);
    final user = Provider.of<AppUser?>(context);

    if (user == null) {
      return const WelcomePage();
    } else {
      return const GetUserData();
    }
  }
}
