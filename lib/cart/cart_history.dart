import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_icon.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColor.mainColor,
            height: Dimensions.number100,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.number45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Lịch sử mua hàng",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColor.mainColor,
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.number15,
                left: Dimensions.number15,
                right: Dimensions.number15),
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (int i = 0; i < 10; i++)
                      Container(
                        height: Dimensions.number100 * 1.2,
                        margin: EdgeInsets.only(bottom: Dimensions.number15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "14/05/2022"),
                            SizedBox(height: Dimensions.number10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(5, (index) {
                                      return index <= 2
                                          ? Container(
                                              height: Dimensions.number70,
                                              width: Dimensions.number70,
                                              margin: EdgeInsets.only(
                                                  right: Dimensions.number5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.border15),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          "assets/image/somi01.png"))),
                                            )
                                          : Container();
                                    })),
                                Container(
                                  height: Dimensions.number70,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SmallText(
                                          text: "Total",
                                          color: AppColor.textColor),
                                      BigText(text: "3 items"),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.number10,
                                            vertical: Dimensions.number5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.number5),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.mainColor)),
                                        child: SmallText(
                                          text: "one more",
                                          color: AppColor.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  ],
                )),
          ))
        ],
      ),
    );
  }
}
