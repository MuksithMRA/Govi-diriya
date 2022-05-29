
import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';

import 'package:govidiriya/providers/login_backend.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  final dynamic labelName;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController? newController;
  final IconData? suffixIcon;
  final String? hintText;
  final dynamic validator;
  final double? height;
  final TextInputType? textInputType;

  const CustomTextField({
    Key? key,
    this.labelName,
    required this.prefixIcon,
    required this.isPassword,
    this.newController,
    this.suffixIcon,
    this.hintText,
    this.validator,
    this.height,
    this.textInputType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final loginbackend = Provider.of<LoginBackend>(context, listen: false);
    loginbackend.obsecure = widget.isPassword;
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
        child: Consumer<LoginBackend>(
          builder: (context, myType, child) {
            return SizedBox(
              width: MediaResponsive().getWidth(context) * 0.8,
              height: widget.height,
              child: Center(
                child: TextFormField(
                  keyboardType: widget.textInputType,
                  validator: widget.validator,
                  onChanged: (value) {},
                  controller: widget.newController,
                  obscureText: widget.labelName == "Password" ||
                          widget.labelName == "Confirm Password"
                      ? myType.obsecure
                      : false,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  cursorHeight: 25,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    suffixIcon: Icon(widget.suffixIcon),
                    prefixIcon: Icon(
                      widget.prefixIcon,
                      color: Colors.black,
                    ),
                    suffix: widget.isPassword
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 0),
                            child: InkWell(
                                onTap: () {
                                  myType.onchange();
                                },
                                child: Icon(myType.obsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                          )
                        : const SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                    focusedBorder: InputBorder.none,
                    labelText: widget.labelName,
                    border: InputBorder.none,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
