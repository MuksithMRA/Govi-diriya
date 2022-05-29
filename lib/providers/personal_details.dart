import 'package:flutter/cupertino.dart';

class ShowPesonalDetails extends ChangeNotifier {
  String? gender;
  String? role;
  bool? isFertilizer;
  bool? isHarvest;
  bool? isUtills;

//check box Function

  setFertilizerState(bool? F) {
    isFertilizer = F;
    notifyListeners();
  }

  setHarvestState(bool? H) {
    isHarvest = H;
    notifyListeners();
  }

  setUtillsState(bool? U) {
    isUtills = U;
    notifyListeners();
  }

  List setCheckBoxValues() {
    List<String> tempArray = [];
    Map<String, bool?> values = {
      "Fertilizer": isFertilizer,
      "Harvest": isHarvest,
      "Utills": isUtills,
    };

    values.forEach((key, value) {
      if (value == true) {
        tempArray.add(key);
      }
    });
    notifyListeners();
    return tempArray;
  }

//Radio Button Function
  setRadioButtonValues(String? genderVal) {
    gender = genderVal;
    notifyListeners();
  }

  //dropdown function
  setSelectedRole(String? selectedRole) {
    role = selectedRole;
    notifyListeners();
  }
}
