import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class HistoryForm extends StatefulWidget {
  const HistoryForm({Key? key}) : super(key: key);

  @override
  State<HistoryForm> createState() => _HistoryFormState();
}

class _HistoryFormState extends State<HistoryForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: Dimensions.number10,
          top: Dimensions.number10,
          left: Dimensions.number10),
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
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.border15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/image/somi01.png"))),
                                  )
                                : Container();
                          })),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, CartHistoryscreen.routeName),
                        child: Container(
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
                                        width: 1, color: AppColor.mainColor)),
                                child: SmallText(
                                  text: "Chi tiết",
                                  color: AppColor.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
