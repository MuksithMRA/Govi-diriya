import 'package:cloud_firestore/cloud_firestore.dart';

class HeroGallery {
  String img;
  String id;

  HeroGallery({required this.img, required this.id});

  factory HeroGallery.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data as Map;
    return HeroGallery(img: data['img'], id: doc.id);
  }
}
