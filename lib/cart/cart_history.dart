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
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: BigText(
          text: "Lịch sử mua hàng",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
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
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.number20,
                                            vertical: Dimensions.number5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.number5),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.mainColor)),
                                        child: SmallText(
                                          text: "Chi tiết",
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
