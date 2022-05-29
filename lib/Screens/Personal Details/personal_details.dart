
import 'package:flutter/material.dart';
import 'package:govidiriya/Animations/page_transition.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Screens/Request%20Help/request_help.dart';
import 'package:govidiriya/Service/auth.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/leaf_button.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/snack_bar.dart';
import 'package:govidiriya/Widgets/Personal%20Details/check_box_bar.dart';
import 'package:govidiriya/Widgets/Personal%20Details/custom_drop_down.dart';
import 'package:govidiriya/Widgets/Personal%20Details/custom_radio_buttonbar.dart';
import 'package:govidiriya/Widgets/loading.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:govidiriya/constants/fonts.dart';
import 'package:govidiriya/providers/personal_details.dart';
import 'package:govidiriya/providers/signup_visibility.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final AuthService _auth = AuthService();
  bool _isLoading = false;

  final TextEditingController _cemail = TextEditingController();
  final TextEditingController _cAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupProvider =
        Provider.of<SignupVisibility>(context, listen: false);
    final _personaldetails =
        Provider.of<ShowPesonalDetails>(context, listen: false);
    return _isLoading
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
                            "Personal Details",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "We want to know more about you",
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
                      Column(
                        children: <Widget>[
                          CustomTextField(
                            labelName: "Email  (optional)",
                            prefixIcon: Icons.mail,
                            isPassword: false,
                            newController: _cemail,
                          ),
                          const CustomHBox(
                            w: 1,
                            h: 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.male),
                              CustomText(color: kBlack, text: "Gender"),
                              CustomRadioButtonBar(),
                            ],
                          ),
                          const CustomHBox(
                            w: 1,
                            h: 0.015,
                          ),
                          CustomTextField(
                            labelName: "Address",
                            prefixIcon: Icons.home,
                            isPassword: false,
                            newController: _cAddress,
                          ),
                          const CheckBoxBar(),
                          const CustomDropDown(),
                        ],
                      ),
                      const CustomHBox(
                        w: 1,
                        h: 0.03,
                      ),
                      WelcomeButtons(
                          title: "Let's Go",
                          route: () async {
                            if (_personaldetails.gender == null ||
                                _cAddress.text.isEmpty ||
                                _personaldetails.role == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar("Fields can not be empty",
                                      Icons.report, kRed));
                            } else {
                              setState(() {
                                _isLoading = true;
                              });

                              await _auth.signUpWithEmailAndPassword(
                                context,
                                signupProvider.phoneMail.toString(),
                                signupProvider.password.toString(),
                                signupProvider.firstName,
                                signupProvider.lastName,
                                signupProvider.phone,
                                _cemail.text,
                                _personaldetails.gender.toString(),
                                _cAddress.text,
                                _personaldetails.setCheckBoxValues().toString(),
                                _personaldetails.role.toString(),
                              );
                              debugPrint(signupProvider.phoneMail.toString());
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.push(
                                context,
                                ScaleTransition1(
                                  const RequestHelp(),
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar("Signup Success", Icons.done,
                                      primaryColor));
                            }
                          }),
                      const CustomHBox(
                        w: 1,
                        h: 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
