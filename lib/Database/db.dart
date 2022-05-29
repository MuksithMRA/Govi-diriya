import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:govidiriya/Models/hero_gallery.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<HeroGallery>> streamImgs(User? user) {
    var refs = _db.collection('users').doc(user!.uid).collection('Gallery');

    return refs.snapshots().map(
          (list) => list.docs.map((e) => HeroGallery.fromFirestore(e)).toList(),
        );
  }
}


