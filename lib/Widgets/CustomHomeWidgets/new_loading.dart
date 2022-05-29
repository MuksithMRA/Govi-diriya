import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:govidiriya/constants/colors.dart';

class NewLoading extends StatelessWidget {
  const NewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitCubeGrid(
      color: primaryColor,
      size: 50.0,
    );
  }
}
