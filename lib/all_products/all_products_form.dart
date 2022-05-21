import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/icon_and_text_widgets.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class AllProductsForm extends StatefulWidget {
  const AllProductsForm({Key? key}) : super(key: key);

  @override
  State<AllProductsForm> createState() => _AllProductsFormState();
}

class _AllProductsFormState extends State<AllProductsForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Dimensions.number10),
        color: Colors.white,
        child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              for (int i = 0; i < 10; i++)
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, PopularClotheDetail.routeName),
                  child: Container(
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
                        Container(
                          height: Dimensions.number85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.border15),
                                bottomRight:
                                    Radius.circular(Dimensions.border15)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.number10,
                                right: Dimensions.number10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Sơ mi trắng đen "),
                                SizedBox(height: Dimensions.number10),
                                SmallText(
                                    text:
                                        "Chất liệu thân thiện với môi trường"),
                                SizedBox(height: Dimensions.number10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.checkroom,
                                        iconColor: Colors.black,
                                        text: "Cotton"),
                                    SizedBox(width: Dimensions.number15),
                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        iconColor: AppColor.mainColor,
                                        text: "Hồ Chí Minh")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ]));
  }
}
