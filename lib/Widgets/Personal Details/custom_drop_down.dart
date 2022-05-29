import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:govidiriya/providers/personal_details.dart';
import 'package:provider/provider.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool _isBackPressedOrTouchedOutSide = false,
      // ignore: prefer_final_fields
      _isPanDown = false;
  late List<String> _list;
  late String selectedItem;
  @override
  void initState() {
    _list = ["Farmer", "WholeSeller", "Other"];
    selectedItem = 'Select your role';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final setdropdown = Provider.of<ShowPesonalDetails>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(5, 7), // changes position of shadow
              )
            ]),
        width: MediaQuery.of(context).size.width,
        child: AwesomeDropDown(
          elevation: 0,
          dropDownTopBorderRadius: 0,
          dropDownBottomBorderRadius: 50,
          isPanDown: _isPanDown,
          dropDownList: _list,
          isBackPressedOrTouchedOutSide: _isBackPressedOrTouchedOutSide,
          selectedItem: selectedItem,
          onDropDownItemClick: (selectedItem) {
            setdropdown.setSelectedRole(selectedItem);
            debugPrint(setdropdown.role);
          },
          dropStateChanged: (isOpened) {
            if (!isOpened) {
              _isBackPressedOrTouchedOutSide = false;
            }
          },
        ),
      ),
    );
  }
}
