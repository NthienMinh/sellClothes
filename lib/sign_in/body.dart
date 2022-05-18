import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/sign_in/sign_in_form.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: Dimensions.number30),
          Container(
            width: double.maxFinite,
            height: Dimensions.number45 + Dimensions.number10,
            child: Column(
              children: [
                Text(
                  "FTEAM SHOP",
                  style: TextStyle(
                      fontSize: Dimensions.font20 * 2,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.number30),
          BigText(
            text: "WELCOME",
            size: Dimensions.font26,
            color: AppColor.mainBlackColor,
          ),
          SmallText(
            text: "Đăng nhập bằng email và mật khẩu",
            size: Dimensions.font16,
            color: AppColor.paraColor,
          ),
          SizedBox(height: Dimensions.number30),
          SignInForm(),
          SizedBox(height: Dimensions.number70),
          Text(
            "@Ứng dụng được phát triển bởi nhóm FTeam",
            style: TextStyle(color: AppColor.paraColor),
          )
        ],
      ),
    );
  }
}
