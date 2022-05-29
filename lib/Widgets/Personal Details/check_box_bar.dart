import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/providers/personal_details.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';

import 'package:govidiriya/constants/colors.dart';
import 'package:provider/provider.dart';

class CheckBoxBar extends StatefulWidget {
  const CheckBoxBar({Key? key}) : super(key: key);

  @override
  State<CheckBoxBar> createState() => _CheckBoxBarState();
}

class _CheckBoxBarState extends State<CheckBoxBar> {
  bool shouldCheckDefault1 = false;
  bool shouldCheckDefault2 = false;
  bool shouldCheckDefault3 = false;
  @override
  Widget build(BuildContext context) {
    final checkBoxProvider =
        Provider.of<ShowPesonalDetails>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: const [
              CustomText(
                color: kBlack,
                text: "Category : ",
                fontSize: 18,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaResponsive().getWidth(context) * 0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomCheckBox(
                      value: shouldCheckDefault1,
                      shouldShowBorder: true,
                      borderColor: primaryColor,
                      checkedFillColor: primaryColor,
                      borderRadius: 8,
                      borderWidth: 1,
                      checkBoxSize: 22,
                      onChanged: (val) {
                        setState(() {
                          shouldCheckDefault1 = val;
                        });
                        //do your stuff here
                        checkBoxProvider.setFertilizerState(val);
                        debugPrint(
                            checkBoxProvider.setCheckBoxValues().toString());
                      },
                    ),
                    const CustomText(color: kBlack, text: "Fertilizer"),
                  ],
                ),
                Row(
                  children: [
                    CustomCheckBox(
                      value: shouldCheckDefault2,
                      shouldShowBorder: true,
                      borderColor: primaryColor,
                      checkedFillColor: primaryColor,
                      borderRadius: 8,
                      borderWidth: 1,
                      checkBoxSize: 22,
                      onChanged: (val) {
                        setState(() {
                          shouldCheckDefault2 = val;
                        });
                        //do your stuff here
                        Provider.of<ShowPesonalDetails>(context, listen: false)
                            .setHarvestState(val);
                        debugPrint(
                            checkBoxProvider.setCheckBoxValues().toString());
                      },
                    ),
                    const CustomText(color: kBlack, text: "Harvest"),
                  ],
                ),
                Row(
                  children: [
                    CustomCheckBox(
                      value: shouldCheckDefault3,
                      shouldShowBorder: true,
                      borderColor: primaryColor,
                      checkedFillColor: primaryColor,
                      borderRadius: 8,
                      borderWidth: 1,
                      checkBoxSize: 22,
                      onChanged: (val) {
                        setState(() {
                          shouldCheckDefault3 = val;
                        });

                        //do your stuff here
                        Provider.of<ShowPesonalDetails>(context, listen: false)
                            .setUtillsState(val);
                        debugPrint(
                            checkBoxProvider.setCheckBoxValues().toString());
                      },
                    ),
                    const CustomText(color: kBlack, text: "Utills"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
