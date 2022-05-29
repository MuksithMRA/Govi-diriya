import 'package:flutter/material.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/constants/colors.dart';

class HomeSpace extends StatelessWidget {
  const HomeSpace({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Center(
                        child: SizedBox(
                      width: ScreenSize.width! * 0.125,
                      child: const FittedBox(
                        child: Text(
                          "Home",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    )),
                    height: ScreenSize.height! * 0.08,
                    width: ScreenSize.width! * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: primaryColor,
                        width: 4,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                height: ScreenSize.height! * 0.31,
                width: ScreenSize.width!,
              ),
            );
  }
}