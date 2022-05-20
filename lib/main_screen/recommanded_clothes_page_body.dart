import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/clothes/recommanded_clothe_detail.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_column.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/icon_and_text_widgets.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class RecommandedClothePageBody extends StatefulWidget {
  const RecommandedClothePageBody({Key? key}) : super(key: key);

  @override
  State<RecommandedClothePageBody> createState() =>
      _RecommandedClothePageBodyState();
}

class _RecommandedClothePageBodyState extends State<RecommandedClothePageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

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
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, recommandedClotheDetail.routeName),
                child: AppColumn(text: "Sơ mi trắng đen"),
              )),
        ),
      )
    ]);
  }
}
