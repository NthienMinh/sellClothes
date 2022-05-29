import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/models/product.dart';
import 'package:mobile_ui/screens/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/screens/cart_no_data/no_data_page.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/main_screen/banner.dart';
import 'package:mobile_ui/screens/main_screen/popular_product.dart';
import 'package:mobile_ui/screens/main_screen/search_field.dart';
import 'package:mobile_ui/screens/widgets/app_icon.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:mobile_ui/controller/products_controler.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'recommanded_clothes_page_body.dart';

class MainClothesPage extends StatefulWidget {
  const MainClothesPage({Key? key}) : super(key: key);

  @override
  State<MainClothesPage> createState() => _MainClothesPageState();
}

class _MainClothesPageState extends State<MainClothesPage> {
  late PersistentTabController _controller;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getProducts();
      setState(() {});
    });
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      shrinkWrap: true,
      children: [
        Container(
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
                onTap: () => Navigator.pushNamed(context, NoDataPage.routeName),
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
        RecommandedClothePageBody(products: products),
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
        popularProducts(products: products)
      ],
    ));
  }

  Future<void> getProducts() async {
    String productsAdd = "/products";
    BaseAPI _baseAPI = BaseAPI();
    await _baseAPI.getData(productsAdd).then((value) {
      if (value.apiStatus == API_STATUS.SUSSCESSED) {
        products.clear();

        value.object.forEach((element) {
          products.add(Product.fromJson(element));
        });
      }
    });
    print("---------------------" + products[0].productName!);
  }
}
