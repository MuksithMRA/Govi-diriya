import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  String? _id;
  String? _fname;
  String? _lname;
  String? _email;
  String? _phone;
  String? _gender;
  String? _address;
  String? _categories;
  String? _role;
  List<DocumentSnapshot>? _imagedocList;

  get getImagedocList => _imagedocList;
  set setImagedocList(imagedocList) => _imagedocList = imagedocList;

  //Id
  get getId => _id;
  set setId(id) => _id = id;

  //Fname
  get getFname => _fname;
  set setFname(fname) => _fname = fname;

  //Lname
  get getLname => _lname;
  set setLname(lname) => _lname = lname;

  //Email
  get getEmail => _email;
  set setEmail(email) => _email = email;

  //Phone
  get getPhone => _phone;
  set setPhone(phone) => _phone = phone;

  //Gender
  get getGender => _gender;
  set setGender(gender) => _gender = gender;

  //Address
  get getAddress => _address;
  set setAddress(address) => _address = address;

  //Category
  get getCategories => _categories;
  set setCategories(categories) => _categories = categories;

  //Role
  get getRole => _role;
  set setRole(role) => _role = role;

  //All
  void setData(
      {String? id,
      String? fname,
      String? lname,
      String? email,
      String? phone,
      String? gender,
      String? address,
      String? categories,
      String? role,
      List<DocumentSnapshot>? imagedocList}) {
    _id = id;
    _fname = fname;
    _lname = lname;
    _email = email;
    _phone = phone;
    _gender = gender;
    _address = address;
    _categories = categories;
    _role = role;
    _imagedocList = imagedocList;
  }

  /*UserData(
      {required _id,
      required _fname,
      required _lname,
      required _email,
      required _phone,
      required _gender,
      required _address,
      required _categories,
      required _role});*/
}
