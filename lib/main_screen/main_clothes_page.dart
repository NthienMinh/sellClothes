import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/cart/cart_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/main_screen/banner.dart';
import 'package:mobile_ui/main_screen/popular_product.dart';
import 'package:mobile_ui/main_screen/search_field.dart';
import 'package:mobile_ui/widgets/app_icon.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/small_text.dart';

import 'recommanded_clothes_page_body.dart';

class MainClothesPage extends StatefulWidget {
  const MainClothesPage({Key? key}) : super(key: key);

  @override
  State<MainClothesPage> createState() => _MainClothesPageState();
}

class _MainClothesPageState extends State<MainClothesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
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
                    onTap: () =>
                        Navigator.pushNamed(context, Cartscreen.routeName),
                    child: Container(
                      child: AppIcon(
                        icon: Icons.shopping_cart,
                        iconColor: Colors.white,
                        backgroundColor: AppColor.mainColor,
                        size: Dimensions.number40,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          DiscountBanner(),
          SizedBox(height: Dimensions.number5),
          Container(
            margin: EdgeInsets.only(left: Dimensions.number20),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              BigText(text: "Sản phẩm"),
              SizedBox(width: Dimensions.number10),
              Container(child: BigText(text: "-", color: Colors.black26)),
              SizedBox(width: Dimensions.number10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Yêu thích",
                ),
              )
            ]),
          ),
          SizedBox(height: Dimensions.number10),
          RecommandedClothePageBody(),
          SizedBox(height: Dimensions.number20),
          //text
          Container(
            margin: EdgeInsets.only(left: Dimensions.number20),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              BigText(text: "Sản phẩm"),
              SizedBox(width: Dimensions.number10),
              Container(child: BigText(text: "-", color: Colors.black26)),
              SizedBox(width: Dimensions.number10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Phổ biến"),
              )
            ]),
          ),
          SizedBox(height: Dimensions.number20),
          popularProducts()
        ],
      ),
    ));
  }
}
