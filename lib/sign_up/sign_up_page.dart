import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_text_field.dart';
import 'package:mobile_ui/widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
              width: Dimensions.number100 * 1.45,
              height: Dimensions.number100 * 1.45,
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(Dimensions.border15),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/logo.png"))),
            )),
          ),
          AppTextField(
              textController: nameController,
              hintText: "Tên",
              icon: Icons.person),
          SizedBox(height: Dimensions.number15),
          AppTextField(
              textController: phoneController,
              hintText: "Điện thoại",
              icon: Icons.phone),
          SizedBox(height: Dimensions.number15),
          AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email),
          SizedBox(height: Dimensions.number15),
          AppTextField(
              textController: passWordController,
              hintText: "Mật khẩu",
              icon: Icons.key),
          SizedBox(height: Dimensions.number15),
          AppTextField(
              textController: confirmPassWordController,
              hintText: "Xác nhận mật khẩu",
              icon: Icons.key),
          SizedBox(height: Dimensions.number15),
          Container(
            height: Dimensions.screenHeight / 13,
            width: Dimensions.screenWidth / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.border30),
                color: AppColor.mainColor),
            child: Center(
              child: BigText(
                text: "Đăng kí",
                size: Dimensions.font26,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: Dimensions.number10),
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Đã có tài khoản?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.number7 + Dimensions.number5))),
          SizedBox(height: Dimensions.number25),
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "@Ứng dụng được thực hiện bởi FTeam",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.number7 + Dimensions.number5)))
        ],
      ),
    );
  }
}
