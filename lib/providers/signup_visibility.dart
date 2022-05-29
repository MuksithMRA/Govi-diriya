import 'package:flutter/cupertino.dart';

class SignupVisibility extends ChangeNotifier {
  bool isVisible = false;
  String _name = "User";
  String? firstName;
  String? lastName;
  String? phone;
  String? phoneMail;
  String? password;

  whenClicked() {
    isVisible = !isVisible;
    notifyListeners();
  }

  String getName() => _name;
  setName(String name) {
    _name = name;
    notifyListeners();
  }

  getSignupDetails(
    String? fName,
    String? lName,
    String? phoneNumb,
    String? phoneM,
    String? pass,
  ) {
    firstName = fName;
    lastName = lName;
    phone = phoneNumb;
    phoneMail = phoneM; 
    password = pass;
  }
}
