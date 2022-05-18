import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/forgot_password/forgot_password_form.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/small_text.dart';

class Body extends StatelessWidget {
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
            text: "FORGOT PASSWORD",
            size: Dimensions.font26,
            color: AppColor.mainBlackColor,
          ),
          SizedBox(height: Dimensions.number7),
          SmallText(
            text: "Chúng tôi sẽ gửi mật khẩu mới tới Email của bạn!",
            size: Dimensions.font16,
            color: AppColor.paraColor,
          ),
          SizedBox(height: Dimensions.number30),
          ForgotPassWordForm(),
          SizedBox(height: Dimensions.number45),
          Text(
            "@Ứng dụng được phát triển bởi nhóm FTeam",
            style: TextStyle(color: AppColor.paraColor),
          )
        ],
      ),
    );
  }
}
