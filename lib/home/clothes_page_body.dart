import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_column.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/icon_and_text_widgets.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class ClothePageBody extends StatefulWidget {
  const ClothePageBody({Key? key}) : super(key: key);

  @override
  State<ClothePageBody> createState() => _ClothePageBodyState();
}

class _ClothePageBodyState extends State<ClothePageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  //@override
  // void initState() {
  //   super.initState();
  //   pageController.addListener(() {
  //     setState(() {
  //       _currPageValue = pageController.page!;
  //       print("Current value is" + _currPageValue.toString());
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: Dimensions.pageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
      SizedBox(height: Dimensions.number20),
      //text
      Container(
        margin: EdgeInsets.only(left: Dimensions.number20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          BigText(text: "Sản phẩm"),
          SizedBox(width: Dimensions.number10),
          Container(child: BigText(text: "-", color: Colors.black26)),
          SizedBox(width: Dimensions.number10),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: SmallText(text: "Phổ biến"),
          )
        ]),
      ),
      //list item and image
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.number10,
                  right: Dimensions.number10,
                  bottom: Dimensions.number5),
              child: Row(children: [
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
                Expanded(
                  child: Container(
                    height: Dimensions.number85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.border15),
                          bottomRight: Radius.circular(Dimensions.border15)),
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
                              text: "Chất liệu thân thiện với môi trường"),
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
                )
              ]),
            );
          }),
    ]);
  }

  Widget _buildPageItem(int index) {
    return Stack(children: [
      Container(
        height: Dimensions.pageViewContainer,
        margin: EdgeInsets.only(
            top: Dimensions.number5,
            left: Dimensions.number5,
            right: Dimensions.number5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.border30),
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/somi01.png"))),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: Dimensions.pageViewTextContainer,
          margin: EdgeInsets.only(
              left: Dimensions.number15,
              right: Dimensions.number15,
              bottom: Dimensions.number5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.border30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)),
                BoxShadow(color: Colors.white, offset: Offset(-5, 0))
              ]),
          child: Container(
            padding: EdgeInsets.only(
                top: Dimensions.number10,
                left: Dimensions.number15,
                right: Dimensions.number15),
            child: AppColumn(text: "Sơ mi trắng đen"),
          ),
        ),
      )
    ]);
  }
}
