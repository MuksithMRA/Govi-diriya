import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/CustomHomeWidgets/pie_chart.dart';

class UserCategoryingCounter extends StatelessWidget {
  const UserCategoryingCounter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          CustomPieChart(
                            farmersCount: 2,
                            othersCount: 1,
                            wholeSellerCount: 3,
                          ),
                        ],
                      );
  }
}