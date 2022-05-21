import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/clothes/recommanded_clothe_detail.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/icon_and_text_widgets.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class popularProducts extends StatefulWidget {
  const popularProducts({Key? key}) : super(key: key);

  @override
  State<popularProducts> createState() => _popularProductsState();
}

class _popularProductsState extends State<popularProducts> {
  PageController pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.number70 * 2 - Dimensions.number25,
          child: PageView.builder(
              controller: pageController,
              itemCount: 8,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, PopularClotheDetail.routeName),
          child: Row(
            children: [
              Container(
                width: Dimensions.number100,
                height: Dimensions.number100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.border15),
                    color: Colors.white38,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/somi01.png"))),
              ),
              Container(
                height: Dimensions.number85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.border15),
                      bottomRight: Radius.circular(Dimensions.border15)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.number10, right: Dimensions.number10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text: "Sơ mi trắng đen "),
                      SizedBox(height: Dimensions.number10),
                      SmallText(text: "Chất liệu thân thiện với môi trường"),
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
        )
      ],
    );
  }
}
