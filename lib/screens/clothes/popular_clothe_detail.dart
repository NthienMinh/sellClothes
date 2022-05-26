import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/screens/cart/cart_screen.dart';
import 'package:mobile_ui/screens/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/widgets/app_icon.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:mobile_ui/screens/widgets/text_widget.dart';

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
  bool check1 = true;
  bool check2 = false;
  bool check3 = false;
  bool check4 = true;
  bool check5 = false;
  bool check6 = false;
  bool check7 = false;
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
                child: Row(children: [
                  SizedBox(
                    width: Dimensions.number10,
                  ),
                  BigText(
                    text: 'Giá: ' + price.toString() + ' VND',
                    color: Colors.red,
                    size: Dimensions.number25,
                  )
                ]),
              ),
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
          SizedBox(
            height: Dimensions.number10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.border30),
                    topRight: Radius.circular(Dimensions.border30))),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.number15, bottom: Dimensions.number10),
              child: Row(
                children: [
                  BigText(text: "Color: "),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check1 = true;
                      check2 = false;
                      check3 = false;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: check1
                          ? Icon(Icons.check, color: Colors.white)
                          : Container(),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.number7),
                          color: Color(0xFF676D5F)),
                    ),
                  ),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check1 = false;
                      check2 = true;
                      check3 = false;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: check2
                          ? Icon(Icons.check, color: Colors.white)
                          : Container(),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.number7),
                          color: Color(0xFF69233C)),
                    ),
                  ),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check1 = false;
                      check2 = false;
                      check3 = true;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: check3
                          ? Icon(Icons.check, color: Colors.white)
                          : Container(),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.number7),
                          color: Color(0xFF3F3660)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.number15, bottom: Dimensions.number10),
              child: Row(
                children: [
                  BigText(text: "Size: "),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check4 = true;
                      check5 = false;
                      check6 = false;
                      check7 = false;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.number7,
                            top: Dimensions.number5,
                            right: Dimensions.number5,
                            bottom: Dimensions.number7),
                        child: Container(
                            width: Dimensions.number30,
                            height: Dimensions.number30,
                            child: BigText(text: 'S')),
                      ),
                      decoration: BoxDecoration(
                          color: check4 ? AppColor.checked : AppColor.unchecked,
                          borderRadius:
                              BorderRadius.circular(Dimensions.number7),
                          border: Border.all(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check4 = false;
                      check5 = true;
                      check6 = false;
                      check7 = false;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.number7,
                            top: Dimensions.number5,
                            right: Dimensions.number5,
                            bottom: Dimensions.number7),
                        child: Container(
                            width: Dimensions.number30,
                            height: Dimensions.number30,
                            child: BigText(text: 'M')),
                      ),
                      decoration: BoxDecoration(
                        color: check5 ? AppColor.checked : AppColor.unchecked,
                        borderRadius: BorderRadius.circular(Dimensions.number7),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check4 = false;
                      check5 = false;
                      check6 = true;
                      check7 = false;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.number7,
                            top: Dimensions.number5,
                            right: Dimensions.number5,
                            bottom: Dimensions.number7),
                        child: Container(
                            width: Dimensions.number30,
                            height: Dimensions.number30,
                            child: BigText(text: 'L')),
                      ),
                      decoration: BoxDecoration(
                        color: check6 ? AppColor.checked : AppColor.unchecked,
                        borderRadius: BorderRadius.circular(Dimensions.number7),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check4 = false;
                      check5 = false;
                      check6 = false;
                      check7 = true;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: Padding(
                        padding: EdgeInsets.all(5.5),
                        child: Container(
                            width: Dimensions.number30,
                            height: Dimensions.number30,
                            child: BigText(
                              text: 'XL',
                              size: Dimensions.number10 * 1.5,
                            )),
                      ),
                      decoration: BoxDecoration(
                        color: check7 ? AppColor.checked : AppColor.unchecked,
                        borderRadius: BorderRadius.circular(Dimensions.number7),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
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
                      SizedBox(width: Dimensions.number5),
                      BigText(
                        text: count.toString(),
                        color: AppColor.mainBlackColor,
                        size: Dimensions.font26,
                      ),
                      SizedBox(width: Dimensions.number5),
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
                //Nút bấm thêm hàng, thành tiền
                GestureDetector(
                  onTap: () => _showCupertinoDialog(context),
                  child: Container(
                    alignment: Alignment.center,
                    width: Dimensions.number100 * 1.9,
                    padding: EdgeInsets.only(
                        left: Dimensions.number20,
                        right: Dimensions.number20,
                        top: Dimensions.number10,
                        bottom: Dimensions.number10),
                    child: BigText(
                      text: total.toString() + " VND" + " | Add",
                      size: Dimensions.number15,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.border20),
                        color: AppColor.mainColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

_dismissDialog(BuildContext context) {
  Navigator.popAndPushNamed(context, HomePage.routeName);
}

void _showCupertinoDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: BigText(
            text: 'Thêm thành công!',
            color: AppColor.mainBlackColor,
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: SmallText(
                  text: 'Đóng',
                  color: AppColor.mainColor,
                )),
          ],
        );
      });
}
