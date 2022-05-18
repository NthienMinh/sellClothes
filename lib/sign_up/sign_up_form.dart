import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/home/home_page.dart';
import 'package:mobile_ui/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/widgets/app_text_field.dart';
import 'package:mobile_ui/widgets/big_text.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? fullname;
  String? email;
  String? password;
  TextEditingController fullNameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passWordText = TextEditingController();
  TextEditingController confirmPassWordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
              textController: fullNameText,
              hintText: "Tên",
              icon: Icons.person),
          SizedBox(height: Dimensions.number15),
          AppTextField(
              textController: phoneText,
              hintText: "Điện thoại",
              icon: Icons.phone),
          SizedBox(height: Dimensions.number15),
          AppTextField(
              textController: emailText, hintText: "Email", icon: Icons.email),
          SizedBox(height: Dimensions.number15),
          AppTextField(
              textController: passWordText,
              hintText: "Mật khẩu",
              icon: Icons.key),
          SizedBox(height: Dimensions.number15),
          AppTextField(
              textController: confirmPassWordText,
              hintText: "Xác nhận mật khẩu",
              icon: Icons.key),
          SizedBox(height: Dimensions.number20),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, HomePage.routeName),
            child: Container(
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
          ),
          SizedBox(height: Dimensions.number10),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
            child: Text(
              "Đã có tài khoản?",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.number15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
