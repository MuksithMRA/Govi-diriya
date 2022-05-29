import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';

import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/form_fields.dart';
import 'package:govidiriya/constants/colors.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  final TextEditingController _image = TextEditingController();
  final TextEditingController _tag = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: const [
          Flexible(
            child: Center(
              child: CustomText(color: kBlack, text: "Add Photo"),
            ),
          ),
        ],
      ),
      content: SizedBox(
        height: MediaResponsive().getheight(context) * 0.5,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         
            CustomTextField(
              labelName: "Image",
              prefixIcon: Icons.image,
              isPassword: false,
              newController: _image,
            ),
            CustomTextField(
              labelName: "tag",
              prefixIcon: Icons.tag,
              isPassword: false,
              newController: _tag,
            ),
            const CustomHBox(
              w: 1,
              h: 0.03,
            ),
            SizedBox(
              width: MediaResponsive().getWidth(context) * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    child: MaterialButton(
                      color: primaryColor,
                      onPressed: () {
                                            },
                      child: const CustomText(color: kWhite, text: "Add"),
                    ),
                  ),
                  Material(
                    child: MaterialButton(
                      color: primaryColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const CustomText(color: kWhite, text: "Close"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
