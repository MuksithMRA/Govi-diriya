import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Crud {
  //Update Data
  updateData(
    String firstname,
    String lastname,
    String email,
    String phonenumber,
  //  String gender,
    String address,
    // String categories,
    // String role,
  ) {
    FirebaseFirestore.instance
        .collection('student')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "first_name": firstname,
      "last_name": lastname,
      "phone": phonenumber,
      "Email": email,
      //"Gender": gender,
      "Address": address,
     // "Categories": categories,
     // "Role": role,
    });
  }
}
