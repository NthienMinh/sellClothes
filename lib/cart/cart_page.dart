import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_icon.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  static String routeName = "/sign_in";
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: Dimensions.number25 * 1.5,
            left: Dimensions.number15,
            right: Dimensions.number15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  iconColor: Colors.white,
                  backgroundColor: AppColor.mainColor,
                  size: Dimensions.number25,
                ),
                SizedBox(width: Dimensions.number100 * 2),
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColor.mainColor,
                  size: Dimensions.number25,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColor.mainColor,
                  size: Dimensions.number25,
                )
              ],
            )),
        Positioned(
            top: Dimensions.number70,
            left: Dimensions.number15,
            right: Dimensions.number15,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.number10),
              color: AppColor.buttonBackgroundColor,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Container(
                        height: Dimensions.number100,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.number100,
                              height: Dimensions.number100,
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.number10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/image/somi01.png")),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.border15),
                                  color: Colors.white),
                            ),
                            SizedBox(width: Dimensions.number10),
                            Expanded(
                                child: Container(
                              height: Dimensions.number100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                      text: "Sơ mi trắng đen",
                                      color: Colors.black54),
                                  //SizedBox(height: Dimensions.number10),
                                  //SmallText(text: "Cotton"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: "150.000 vnđ",
                                        color: Colors.redAccent,
                                        size: Dimensions.font16,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.number15,
                                            right: Dimensions.number15,
                                            top: Dimensions.number5,
                                            bottom: Dimensions.number5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.border20),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            Icon(Icons.remove,
                                                color: AppColor.signColor),
                                            SizedBox(width: Dimensions.number7),
                                            BigText(text: "0"),
                                            SizedBox(width: Dimensions.number7),
                                            Icon(Icons.add,
                                                color: AppColor.signColor)
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    }),
              ),
            ))
      ]),
    );
  }
}
