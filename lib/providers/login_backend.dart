import 'package:flutter/cupertino.dart';

class LoginBackend extends ChangeNotifier {
  String pass = "";
  String mail = "";

  List<String> phone = ["123"];

  List<String> password = ["hello123"];

  bool obsecure = false;

  onchange() {
    obsecure = !obsecure;
    notifyListeners();
  }
}
