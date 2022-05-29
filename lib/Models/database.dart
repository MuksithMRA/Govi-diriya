import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseEngine {
  final CollectionReference usersList =
      FirebaseFirestore.instance.collection("users");
}
