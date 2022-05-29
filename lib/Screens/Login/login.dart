
import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';

import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/Login/reset_password.dart';
import 'package:govidiriya/Service/auth.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text_button.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/snack_bar.dart';
import 'package:govidiriya/Widgets/loading.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:govidiriya/Screens/HomePage/homepage.dart';
import 'package:govidiriya/Screens/Register/signup.dart';
import 'package:govidiriya/Widgets/Custom_SocialMediaIcons/icon_bar.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/leaf_button.dart';
import 'package:govidiriya/constants/fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  bool loading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool spreadShadow = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final _loginBackend = Provider.of<LoginBackend>(context, listen: false);
    return loading
        ? const Loading()
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const CustomHBox(w: 1, h: 0.06),
                              const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const CustomHBox(
                                h: 0.03,
                                w: 1,
                              ),
                              Text(
                                "Login to your account",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[700]),
                              ),
                              const CustomHBox(
                                h: 0.05,
                                w: 1,
                              ),
                              SizedBox(
                                  width: ScreenSize.width! * 0.7,
                                  child: const SocialMediaIconBar()),
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
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: <Widget>[
                                CustomTextField(
                                  textInputType: TextInputType.phone,
                                  labelName: "Phone Number",
                                  prefixIcon: Icons.call,
                                  isPassword: false,
                                  newController: _email,
                                  validator: (val) {
                                    if (val.isEmpty || val == null) {}
                                    return null;
                                  },
                                ),
                                CustomTextField(
                                  labelName: "Password",
                                  prefixIcon: Icons.lock,
                                  isPassword: true,
                                  newController: _password,
                                  validator: (val) {
                                    if (val.isEmpty || val == null) {}
                                    return null;
                                  },
                                  //TextEditingControllers().passwordL,
                                ),
                                const CustomHBox(w: 1, h: 0.03),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        ScaleTransition1(
                                            const ResetPassword()));
                                  },
                                  child: SizedBox(
                                    width: ScreenSize.width! * 0.7,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        CustomText(
                                          fontSize: 15,
                                          color: kBlack,
                                          text: "Forgot Password",
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const CustomHBox(w: 1, h: 0.04),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: WelcomeButtons(
                              title: "Log In",
                              route: () async {
                                if (_email.text.isNotEmpty ||
                                    _password.text.isNotEmpty) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          "${_email.text}@govidiriya.lk",
                                          _password.text);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        customSnackBar("Invalid Credentials",
                                            Icons.report, kRed));
                                  } else {
                                    setState(() {
                                      loading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackBar("Login Success",
                                          Icons.done, primaryColor),
                                    );

                                    return Navigator.pushAndRemoveUntil(
                                      context,
                                      ScaleTransition1(
                                        const HomePage(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackBar("Fields can not be empty",
                                          Icons.report, kRed));
                                }
                              },
                            ),
                          ),
                          const CustomHBox(w: 1, h: 0.06),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text("Don't have an account?"),
                              SizedBox(
                                width: ScreenSize.width! * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      ScaleTransition1(const SignupPage()));
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomTextButton(text: "English"),
                              CustomTextButton(text: "සිංහල"),
                              CustomTextButton(text: "தமிழ்"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
