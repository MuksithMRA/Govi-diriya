import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govidiriya/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/snack_bar.dart';
import 'package:govidiriya/constants/colors.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  //auth change
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //signin Anony
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //Sign in

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

//Signup
  Future signUpWithEmailAndPassword(
    BuildContext context,
    String pemail,
    String password,
    dynamic firstname,
    dynamic lastname,
    dynamic phonenumber,
    String email,
    String gender,
    String address,
    String categories,
    String role,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: pemail,
        password: password,
      );
      User? user = userCredential.user;
      Map<String, dynamic> account = {
        "first_name": firstname,
        "last_name": lastname,
        "phone": phonenumber,
        "Email": email,
        "Gender": gender,
        "Address": address,
        "Categories": categories,
        "Role": role,
      };
      FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .set(account);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar("Password is too weak", Icons.report, kRed));
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar("Phone number already in use", Icons.report, kRed));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackBar(e.toString(), Icons.report, kRed));
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
