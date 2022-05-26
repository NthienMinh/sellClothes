import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/screens/cart/item_cart_form.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/pay/pay_screen.dart';
import 'package:mobile_ui/screens/widgets/app_icon.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
            top: Dimensions.number25 * 1.5,
            left: Dimensions.number15,
            right: Dimensions.number15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: AppIcon(
                    icon: Icons.arrow_back_ios_new,
                    iconColor: Colors.white,
                    backgroundColor: AppColor.mainColor,
                    size: Dimensions.number25,
                  ),
                ),
                SizedBox(width: Dimensions.number100 * 2),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, HomePage.routeName),
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColor.mainColor,
                    size: Dimensions.number25,
                  ),
                ),
              ],
            )),
        Positioned(
            top: Dimensions.number70,
            left: Dimensions.number15,
            right: Dimensions.number15,
            bottom: Dimensions.number70,
            child: ItemCartForm()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
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
                BigText(
                  text: "1.500.000 VND",
                  color: Colors.red,
                ),
                //Nút bấm thêm hàng, thành tiền
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, PayScreen.routeName),
                  child: Container(
                    alignment: Alignment.center,
                    width: Dimensions.number100 * 1.3,
                    padding: EdgeInsets.only(
                        left: Dimensions.number20,
                        right: Dimensions.number20,
                        top: Dimensions.number10,
                        bottom: Dimensions.number10),
                    child: BigText(
                      text: "Thanh toán",
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
          ),
        )
      ]),
    );
  }
}
