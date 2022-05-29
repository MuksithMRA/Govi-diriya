import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GalleryArea extends StatefulWidget {
  final dynamic heroItem;
  const GalleryArea({Key? key, this.heroItem}) : super(key: key);

  @override
  State<GalleryArea> createState() => _GalleryAreaState();
}

class _GalleryAreaState extends State<GalleryArea> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('Gallery')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    print(_usersStream.toString());
    return StreamBuilder(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading"));
        }
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 4),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, String> data = document.data()! as Map<String, String>;

            print(data.toString());
            return Text("Hello");
          }).toList(),
        );
      },
    );
  }
}
