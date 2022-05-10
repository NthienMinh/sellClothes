import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
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
                Center(
                  child: Container(
                    width: Dimensions.number45,
                    height: Dimensions.number45,
                    child: Icon(
                      Icons.search,
                      size: Dimensions.number24,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.border15),
                      color: AppColor.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(child: ClothePageBody()))
      ],
    ));
  }
}
