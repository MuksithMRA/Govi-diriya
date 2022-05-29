import 'package:flutter/material.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/Authentication%20Wrapper/authentication_wrapper.dart';


class ResWrapper extends StatefulWidget {
  const ResWrapper({Key? key}) : super(key: key);

  @override
  State<ResWrapper> createState() => _ResWrapperState();
}

class _ResWrapperState extends State<ResWrapper> {
  @override
  Widget build(BuildContext context) {
    
  
    
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    ScreenSize.setHeight(_height);
    ScreenSize.setWidth(_width);
    // if (ScreenSize.width! < 650.0) {
    //   return const Scaffold(
    //       body: Center(
    //     child: Text("Mobile"),
    //   ));
    // } else {
    return const Wrapper();
    //}
  }
}
