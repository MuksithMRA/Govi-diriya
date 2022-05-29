
import 'package:flutter/material.dart';
import 'package:govidiriya/Database/update.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/leaf_button.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/snack_bar.dart';
import 'package:govidiriya/Widgets/loading.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:govidiriya/constants/fonts.dart';


class UpdateUserData extends StatefulWidget {
  final String gender;
  final String role;
  final String email;
  final String address;
  final String fname;
  final String lname;
  final String pNo;
  const UpdateUserData({
    Key? key,
    required this.gender,
    required this.role,
    required this.email,
    required this.address,
    required this.fname,
    required this.lname,
    required this.pNo,
  }) : super(key: key);

  @override
  State<UpdateUserData> createState() => _UpdateUserDataState();
}

class _UpdateUserDataState extends State<UpdateUserData> {
  //final AuthService _auth = AuthService();
  bool _isLoading = false;

  final TextEditingController _cemail = TextEditingController();
  final TextEditingController _cAddress = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _pNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _cemail.text = widget.email;
    _cAddress.text = widget.address;
    _fname.text = widget.fname;
    _lname.text = widget.lname;
    _pNo.text = widget.pNo;

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
                            "Update Me",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Update your user details",
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
                            labelName: "First Name",
                            prefixIcon: Icons.person,
                            isPassword: false,
                            newController: _fname,
                          ),
                          const CustomHBox(
                            w: 1,
                            h: 0.015,
                          ),
                          CustomTextField(
                            labelName: "Last Name",
                            prefixIcon: Icons.person,
                            isPassword: false,
                            newController: _lname,
                          ),
                          const CustomHBox(
                            w: 1,
                            h: 0.015,
                          ),
                          CustomTextField(
                            labelName: "Phone number",
                            prefixIcon: Icons.person,
                            isPassword: false,
                            newController: _pNo,
                          ),
                          const CustomHBox(
                            w: 1,
                            h: 0.015,
                          ),
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: const [
                          //     Icon(Icons.male),
                          //     CustomText(color: kBlack, text: "Gender"),
                          //     CustomRadioButtonBar(),
                          //   ],
                          // ),
                          // const CustomHBox(
                          //   w: 1,
                          //   h: 0.015,
                          // ),
                          CustomTextField(
                            labelName: "Address",
                            prefixIcon: Icons.home,
                            isPassword: false,
                            newController: _cAddress,
                          ),
                          // const CheckBoxBar(),
                          // const CustomDropDown(),
                        ],
                      ),
                      const CustomHBox(
                        w: 1,
                        h: 0.03,
                      ),
                      WelcomeButtons(
                          title: "Update",
                          route: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            await Crud().updateData(_fname.text, _lname.text,
                                _cemail.text, _pNo.text, _cAddress.text);
                            setState(() {
                              _isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar("Updated Successfully", Icons.done,
                                  primaryColor),
                            );
                          }),
                      const CustomHBox(
                        w: 1,
                        h: 0.03,
                      ),
                      WelcomeButtons(
                          title: "Cancel",
                          route: () {
                            Navigator.pop(context);
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
