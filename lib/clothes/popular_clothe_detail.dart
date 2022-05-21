import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/cart/cart_screen.dart';
import 'package:mobile_ui/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/home/home_page.dart';
import 'package:mobile_ui/widgets/app_icon.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/text_widget.dart';

class PopularClotheDetail extends StatefulWidget {
  static String routeName = "/popularClotheDetail";
  const PopularClotheDetail({Key? key}) : super(key: key);

  @override
  State<PopularClotheDetail> createState() => _PopularClotheDetailState();
}

class _PopularClotheDetailState extends State<PopularClotheDetail> {
  int count = 1;
  int price = 150000;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: Dimensions.number70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, CartScreen.routeName),
                    child: AppIcon(icon: Icons.shopping_cart_outlined))
              ],
            ),
            stretch: true,
            pinned: true,
            backgroundColor: AppColor.buttonBackgroundColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.number10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.border20),
                        topRight: Radius.circular(Dimensions.border20))),
                child: Center(
                  child: BigText(
                    size: Dimensions.font26,
                    text: "Sơ mi trắng đen",
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.number5, bottom: Dimensions.number5),
              ),
            ),
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    "assets/image/somi01.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: TextWidget(
                    text:
                        "This is an e-commerce app for food delivery using flutter with backend. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, signin or login, payment.This is an e-commerce app for food delivery using flutter with backend. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, signin or login, payment.This is an e-commerce app for food delivery using flutter with backend. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, signin or login, payment.This is an e-commerce app for food delivery using flutter with backend. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, signin or login, payment.This is an e-commerce app for food delivery using flutter with backend. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, signin or login, payment.This is an e-commerce app for food delivery using flutter with backend. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, signin or login, payment."),
                margin: EdgeInsets.only(
                    left: Dimensions.number15, right: Dimensions.number15),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.number25 * 1.5,
                right: Dimensions.number25 * 1.5,
                top: Dimensions.number15,
                bottom: Dimensions.number15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (count > 1) {
                      count--;
                      total = price * count;
                    }
                    setState(() {});
                  },
                  child: AppIcon(
                      iconSize: Dimensions.number15,
                      iconColor: Colors.white,
                      backgroundColor: AppColor.mainColor,
                      icon: Icons.remove),
                ),
                BigText(
                  text: price.toString() + " vnđ" + " x " + count.toString(),
                  color: AppColor.mainBlackColor,
                  size: Dimensions.font26,
                ),
                GestureDetector(
                  onTap: () {
                    count++;
                    total = price * count;
                    setState(() {});
                  },
                  child: AppIcon(
                      iconSize: Dimensions.number15,
                      iconColor: Colors.white,
                      backgroundColor: AppColor.mainColor,
                      icon: Icons.add),
                )
              ],
            ),
          ),
          Container(
            height: Dimensions.number70,
            padding: EdgeInsets.only(
                left: Dimensions.number25,
                right: Dimensions.number25,
                top: Dimensions.number15,
                bottom: Dimensions.number15),
            decoration: BoxDecoration(
                color: AppColor.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.border30),
                    topRight: Radius.circular(Dimensions.border30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.number15,
                      right: Dimensions.number15,
                      top: Dimensions.number10,
                      bottom: Dimensions.number10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.number15),
                      color: Colors.white),
                  child: Icon(Icons.favorite, color: AppColor.mainColor),
                ),
                //Nút bấm thêm hàng, thành tiền
                Container(
                  alignment: Alignment.center,
                  width: Dimensions.number100 + 50,
                  padding: EdgeInsets.only(
                      left: Dimensions.number20,
                      right: Dimensions.number20,
                      top: Dimensions.number10,
                      bottom: Dimensions.number10),
                  child: BigText(
                    text: total.toString() + " vnđ",
                    size: Dimensions.number15,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.border20),
                      color: AppColor.mainColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
