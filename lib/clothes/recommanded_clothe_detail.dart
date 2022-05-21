import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_column.dart';
import 'package:mobile_ui/widgets/app_icon.dart';
import 'package:mobile_ui/widgets/text_widget.dart';

import '../Colors.dart';
import '../widgets/big_text.dart';
import '../widgets/icon_and_text_widgets.dart';
import '../widgets/small_text.dart';

class recommandedClotheDetail extends StatelessWidget {
  static String routeName = "/recommandedClotheDetail";
  const recommandedClotheDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        //image
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.number320,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/somi01.png"))),
            )),
        //Icon back and icon shop_cart
        Positioned(
            top: Dimensions.number25,
            left: Dimensions.number15,
            right: Dimensions.number15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios_new),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            )),
        //text tên sản phẩm vs mấy cái icon tiêu điểm
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.number280 - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.number15,
                  right: Dimensions.number15,
                  top: Dimensions.number20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.border20),
                      topRight: Radius.circular(Dimensions.border20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Sơ mi trắng đen"),
                  SizedBox(height: Dimensions.number20),
                  BigText(text: "Thông tin sản phẩm", size: Dimensions.font20),
                  SizedBox(height: Dimensions.number10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: TextWidget(
                          text: "- Chất liệu:  Áo chất cotton, quần chất kaki mềm dày dặn\n" +
                              "- Kích thước:  freesize từ 42-58kg tùy chiều cao\n" +
                              "- Màu sắc:  đen\n" +
                              "- Kiểu dáng:  trẻ trung, năng động, cá tính, style hàn quốc\n" +
                              "- Phù hợp:  mặc đi học, đi chơi, dạo phố, thể thao, mặc ở nhà,..."),
                    ),
                  )
                ],
              ),
            ))
      ]),
      bottomNavigationBar: Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //nút bấm thêm số lượng mua hàng
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.number20,
                  right: Dimensions.number20,
                  top: Dimensions.number10,
                  bottom: Dimensions.number10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.border20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColor.signColor),
                  SizedBox(width: Dimensions.number7),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.number7),
                  Icon(Icons.add, color: AppColor.signColor)
                ],
              ),
            ),
            //Nút bấm thêm hàng, thành tiền
            Container(
              alignment: Alignment.center,
              width: Dimensions.number100 + 50,
              padding: EdgeInsets.only(
                  left: Dimensions.number20,
                  right: Dimensions.number20,
                  top: Dimensions.number10,
                  bottom: Dimensions.number10),
              child: BigText(
                text: "150.000 vnđ",
                size: Dimensions.number15,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.border20),
                  color: AppColor.mainColor),
            )
          ],
        ),
      ),
    );
  }
}
