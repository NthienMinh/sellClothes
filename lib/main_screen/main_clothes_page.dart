import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/cart/cart_page.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/main_screen/search_field.dart';
import 'package:mobile_ui/widgets/app_icon.dart';
import 'package:mobile_ui/widgets/big_text.dart';

import 'clothes_page_body.dart';

class MainClothesPage extends StatefulWidget {
  const MainClothesPage({Key? key}) : super(key: key);

  @override
  State<MainClothesPage> createState() => _MainClothesPageState();
}

class _MainClothesPageState extends State<MainClothesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.number40, bottom: Dimensions.number15),
            padding: EdgeInsets.only(
                left: Dimensions.number15, right: Dimensions.number15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "FTeam",
                      color: AppColor.mainColor,
                      size: Dimensions.font20,
                    )
                  ],
                ),
                SearchField(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, CartPage.routeName),
                  child: AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColor.mainColor,
                    size: Dimensions.number40,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(child: ClothePageBody()))
      ],
    ));
  }
}
