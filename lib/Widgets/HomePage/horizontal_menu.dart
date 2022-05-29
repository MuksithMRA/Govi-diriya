import 'package:flutter/material.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Models/screen_size.dart';
import 'package:govidiriya/Screens/MarketPlace/market_place.dart';
import 'package:govidiriya/Widgets/CustomHomeWidgets/menu_card.dart';
import 'package:govidiriya/providers/homepage_providers.dart';
import 'package:provider/provider.dart';

class HorizontalMenu extends StatelessWidget {
  const HorizontalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomePageProviders>(context, listen: false);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //Fertilizer Begin
          CustomMenuCard(
            count: '${homeProvider.fertilizerCount.toString()} kg',
            route: const MarketPlace(),
            imgPath: "assets/fertilizer.png",
            screenSize: MediaResponsive(),
            categoryName: "Fertilizers",
            description: " You can buy/Sell Fertilizers from here ",
          ),
          //fertilizer end

          SizedBox(
            width: ScreenSize.width! * 0.1,
          ),

          //Harvest Begin
          CustomMenuCard(
            count: '${homeProvider.harvestCount.toString()} kg',
            route: const MarketPlace(),
            imgPath: "assets/Harvest.png",
            screenSize: MediaResponsive(),
            categoryName: "Harvest",
            description: "You can buy/Sell Harvest From Here",
          ),
          //Harvest  end

          SizedBox(
            width: ScreenSize.width! * 0.1,
          ),

          //Utills Begin

          CustomMenuCard(
            count: homeProvider.fertilizerCount.toString(),
            route: const MarketPlace(),
            imgPath: "assets/utills.png",
            screenSize: MediaResponsive(),
            categoryName: "Utils",
            description: "You can Buy/Sell Utills From Here",
          ),

          //utills end
        ],
      ),
    );
  }
}
