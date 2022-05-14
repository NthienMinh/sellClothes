import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/account/sign_up_page.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_text_field.dart';
import 'package:mobile_ui/widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passWordController = TextEditingController();
    var confirmPassWordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            // height: Dimensions.number100,
            child: Center(
                child: Container(
              width: Dimensions.number100 * 1.6,
              height: Dimensions.number100 * 1.6,
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(Dimensions.border15),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/logo.png"))),
            )),
          ),
          Container(
            margin: EdgeInsets.only(left: Dimensions.number20),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "FTEAM SHOP",
                  style: TextStyle(
                      fontSize: Dimensions.font26, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.number30),
          AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email),
          SizedBox(height: Dimensions.number25),
          AppTextField(
              textController: passWordController,
              hintText: "Mật khẩu",
              icon: Icons.key),
          SizedBox(height: Dimensions.number45),
          Container(
            height: Dimensions.screenHeight / 13,
            width: Dimensions.screenWidth / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.border30),
                color: AppColor.mainColor),
            child: Center(
              child: BigText(
                text: "Đăng nhập",
                size: Dimensions.font26,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: Dimensions.number20),
          RichText(
              text: TextSpan(
                  text: "Chưa có tài khoản?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.number7 + Dimensions.number5),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignUpPage()),
                    text: " Đăng kí",
                    style: TextStyle(
                        color: AppColor.mainBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.number7 * 2))
              ])),
          SizedBox(height: Dimensions.number100),
          RichText(
              text: TextSpan(
                  text: "@Ứng dụng được thực hiện bởi FTeam",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.number7 + Dimensions.number5)))
        ],
      ),
    );
  }
}
