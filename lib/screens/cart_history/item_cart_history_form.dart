import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';

class ItemCartHistoryForm extends StatefulWidget {
  const ItemCartHistoryForm({Key? key}) : super(key: key);

  @override
  State<ItemCartHistoryForm> createState() => _ItemCartHistoryFormState();
}

class _ItemCartHistoryFormState extends State<ItemCartHistoryForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.number10),
      color: Colors.white,
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
                      margin: EdgeInsets.only(bottom: Dimensions.number10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/image/somi01.png")),
                          borderRadius:
                              BorderRadius.circular(Dimensions.border15),
                          color: Colors.white),
                    ),
                    SizedBox(width: Dimensions.number10),
                    Expanded(
                        child: Container(
                      height: Dimensions.number100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                              text: "Sơ mi trắng đen", color: Colors.black54),
                          SmallText(text: 'Color: Red', color: Colors.black54),
                          SmallText(text: 'Size: L', color: Colors.black54),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: "150.000 vnđ",
                                color: Colors.redAccent,
                                size: Dimensions.font16,
                              ),
                              BigText(
                                text: "Số lượng :" + " 1",
                                color: Colors.black54,
                                size: Dimensions.font16,
                              ),
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
    );
  }
}
