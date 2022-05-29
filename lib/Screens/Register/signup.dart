import 'package:flutter/material.dart';


import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Animations/page_transition_slide.dart';
import 'package:govidiriya/Models/mediaquery.dart';

import 'package:govidiriya/Screens/Login/login.dart';

import 'package:govidiriya/Screens/Verification%20Page/verify.dart';


import 'package:govidiriya/Widgets/Common%20Widgets/snack_bar.dart';
import 'package:govidiriya/Widgets/Custom_SocialMediaIcons/icon_bar.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/leaf_button.dart';
import 'package:govidiriya/Widgets/loading.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:govidiriya/constants/fonts.dart';
import 'package:govidiriya/providers/signup_visibility.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _loading = false;
  
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupProvider =
        Provider.of<SignupVisibility>(context, listen: false);
    return _loading
        ? const Loading()
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  width: MediaResponsive().getWidth(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const CustomHBox(
                            h: 0.08,
                            w: 1,
                          ),
                          const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an account, It's free ",
                            style: secondaryStyle(
                              15,
                              FontWeight.w700,
                              Colors.grey,
                              FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                      const CustomHBox(
                        h: 0.05,
                        w: 1,
                      ),
                      const SocialMediaIconBar(),
                      const CustomHBox(
                        h: 0.04,
                        w: 1,
                      ),
                      Text(
                        "Or",
                        style: secondaryStyle(
                          14,
                          FontWeight.w400,
                          Colors.black,
                          FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const CustomHBox(
                        h: 0.03,
                        w: 1,
                      ),
                      Visibility(
                        visible: true,
                        child: Column(
                          children: <Widget>[
                            CustomTextField(
                              labelName: "First Name",
                              prefixIcon: Icons.person,
                              isPassword: false,
                              newController: _fname,
                            ),
                            CustomTextField(
                              labelName: "Last Name",
                              prefixIcon: Icons.person,
                              isPassword: false,
                              newController: _lname,
                            ),
                            CustomTextField(
                              textInputType: TextInputType.phone,
                              labelName: "Phone Number",
                              prefixIcon: Icons.phone,
                              isPassword: false,
                              newController: _phone,
                            ),
                            CustomTextField(
                              labelName: "Password",
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              newController: _password,
                            ),
                            CustomTextField(
                              labelName: "Confirm Password",
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              newController: _cpassword,
                            ),
                          ],
                        ),
                      ),
                      const CustomHBox(
                        w: 1,
                        h: 0.03,
                      ),
                      WelcomeButtons(
                        title: "Register",
                        route: (){
                          signupProvider.setName(_fname.text);
                          if (_phone.text.isNotEmpty ||
                              _fname.text.isNotEmpty ||
                              _lname.text.isNotEmpty ||
                              _cpassword.text.isNotEmpty ||
                              _password.text.isNotEmpty) {
                            if (_cpassword.text == _password.text) {
                              setState(() {
                                _loading = true;
                              });

                              signupProvider.getSignupDetails(
                                _fname.text,
                                _lname.text,
                                _phone.text,
                                "${_phone.text}@govidiriya.lk",
                                _password.text,
                              );

                              // await _auth.signUpWithEmailAndPassword(
                              //   context,
                              //   "${_phone.text}@govidiriya.lk",
                              //   _password.text,
                              //   _fname.text,
                              //   _lname.text,
                              //   _phone.text,
                              // );
                              setState(() {
                                _loading = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar("Confirm Your Number",
                                    Icons.phone, primaryColor),
                              );
                              return Navigator.pushAndRemoveUntil(
                                context,
                                SlideTransition1(
                                  const VerifyNumber(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar(
                                      "Password Confirmation should match",
                                      Icons.report,
                                      kRed));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar("Fields can not be empty",
                                    Icons.report, kRed));
                          }
                        },
                      ),
                      const CustomHBox(
                        w: 1,
                        h: 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              "Already have an account?",
                              style: secondaryStyle(
                                12,
                                FontWeight.w500,
                                kBlack,
                                FontStyle.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaResponsive().getWidth(context) * 0.02,
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    ScaleTransition1(const LoginPage()));
                              },
                              child: Text(
                                " Login",
                                style: secondaryStyle(
                                  15,
                                  FontWeight.w700,
                                  Colors.black,
                                  FontStyle.normal,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const CustomHBox(
                        h: 0.05,
                        w: 1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
