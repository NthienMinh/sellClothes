import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_text_field.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/small_text.dart';

import '../sign_up/sign_up_page.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
              textController: emailText, hintText: "Email", icon: Icons.email),
          SizedBox(height: Dimensions.number25),
          AppTextField(
              textController: passwordText,
              hintText: "Mật khẩu",
              icon: Icons.key),
          SizedBox(height: Dimensions.number25),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: AppColor.mainColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              SmallText(
                text: "Ghi nhớ",
                size: Dimensions.font16,
                color: AppColor.mainBlackColor,
              ),
              SizedBox(width: Dimensions.number100 + Dimensions.number25),
              GestureDetector(
                // onTap: () => Navigator.pushNamed(
                //     context, ForgotPasswordScreen.routeName),
                child: SmallText(
                  text: "Quên mật khẩu",
                  size: Dimensions.font16,
                  color: AppColor.mainBlackColor,
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.number25),
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
          SizedBox(height: Dimensions.number15),
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
                    text: " Đăng ký ngay",
                    style: TextStyle(
                        color: AppColor.mainBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.number7 * 2))
              ])),
          SizedBox(height: Dimensions.number70),
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
