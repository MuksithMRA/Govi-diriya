import 'package:flutter/material.dart';
import 'package:govidiriya/Models/hero.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/Profile/Gallery/add_photo.dart';
import 'package:govidiriya/Widgets/Custom%20Profile%20Widgets/gallery_area.dart';
import 'package:govidiriya/Widgets/Custom_AppBart/custom_appbar.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Custom%20Profile%20Widgets/profile_screen_widgets.dart';
import 'package:govidiriya/constants/colors.dart';

class ProfileGallery extends StatelessWidget {
  const ProfileGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeroImage heroItem = HeroImage();
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            label: const CustomText(color: kWhite, text: "Add Media"),
            icon: const Icon(Icons.add_a_photo),
            backgroundColor: primaryColor,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddPhoto();
                  });
            }),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            elevation: 0,
            title: "MY GALLERY",
            action: [
              Padding(
                padding: EdgeInsets.only(right: ScreenSize.width! * 0.05),
                child: const Icon(Icons.photo),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Align(
              child: Container(
                color: primaryColor,
                height: ScreenSize.height!,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                height: ScreenSize.height! * 0.64,
              ),
            ),
            const ProfileScreenWidget(),
            GalleryArea(
              heroItem: heroItem,
            )
          ],
        ));
  }
}
