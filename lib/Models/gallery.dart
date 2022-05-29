

import 'package:cloud_firestore/cloud_firestore.dart';

class GalleryList {
  List<DocumentSnapshot>? _listOfImages;


 List<DocumentSnapshot>? get getListOfImages => _listOfImages;
 set setListOfImages(List<DocumentSnapshot>? listOfImages) => _listOfImages = listOfImages;
}
