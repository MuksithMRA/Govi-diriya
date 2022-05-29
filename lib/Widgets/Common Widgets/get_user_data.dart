import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govidiriya/Models/user_data.dart';
import 'package:govidiriya/Screens/HomePage/homepage.dart';
import 'package:provider/provider.dart';

class GetUserData extends StatefulWidget {
  const GetUserData({Key? key}) : super(key: key);

  @override
  State<GetUserData> createState() => _GetUserDataState();
}

class _GetUserDataState extends State<GetUserData> {
  Map? userData;
  List<DocumentSnapshot<dynamic>>? docList;

  @override
  void initState() {
    super.initState();
    _getDocs();
    _getDocList();
  }

  _getDocs() {
    User? _firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(_firebaseUser!.uid)
        .get()
        .then((value) {
      setState(() {
        userData = value.data()!;
      });
    });
  }

  _getDocList() async {
    User? _firebaseUser = FirebaseAuth.instance.currentUser;
    final QuerySnapshot _result = await FirebaseFirestore.instance
        .collection("users")
        .doc(_firebaseUser!.uid)
        .collection("Gallery")
        .get();

    setState(() {
      docList = _result.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userData != null) {
      Provider.of<UserData>(context, listen: false).setData(
        address: userData!["Address"],
        categories: userData!["Categories"],
        email: userData!["Email"],
        fname: userData!["first_name"],
        gender: userData!["Gender"],
        id: FirebaseAuth.instance.currentUser!.uid,
        lname: userData!["last_name"],
        phone: userData!["phone"],
        role: userData!["Role"],
        imagedocList: docList,
      );
    } else {
      debugPrint("Can not find any Data");
    }

   
   
    return const HomePage();
  }
}
