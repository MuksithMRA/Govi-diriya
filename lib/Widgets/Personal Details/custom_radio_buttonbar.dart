import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:govidiriya/providers/personal_details.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:provider/provider.dart';

class CustomRadioButtonBar extends StatefulWidget {
  const CustomRadioButtonBar({Key? key}) : super(key: key);

  @override
  State<CustomRadioButtonBar> createState() => _CustomRadioButtonBarState();
}

class _CustomRadioButtonBarState extends State<CustomRadioButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomRadioButton(
        unSelectedBorderColor: primaryColor,
        selectedBorderColor: primaryColor,
        autoWidth: true,
        elevation: 0,
        absoluteZeroSpacing: true,
        unSelectedColor: Theme.of(context).canvasColor,
        buttonLables: const [
          'Male',
          'Female',
        ],
        buttonValues: const [
          "MALE",
          "FEMALE",
        ],
        buttonTextStyle: const ButtonTextStyle(
            selectedColor: Colors.white,
            unSelectedColor: Colors.black,
            textStyle: TextStyle(fontSize: 16)),
        radioButtonValue: (value) {
            Provider.of<ShowPesonalDetails>(context, listen: false)
            .setRadioButtonValues(value.toString());
        debugPrint(Provider.of<ShowPesonalDetails>(context, listen: false).gender);
        
        },
        selectedColor: primaryColor,
      ),
    );
  }
}
