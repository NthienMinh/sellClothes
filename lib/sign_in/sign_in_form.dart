import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/forgot_password/forgot_password.dart';
import 'package:mobile_ui/home/home_page.dart';
import 'package:mobile_ui/main_screen/popular_product.dart';
import 'package:mobile_ui/sign_up/sign_up_screen.dart';
import 'package:mobile_ui/widgets/app_text_field.dart';
import 'package:mobile_ui/widgets/big_text.dart';
import 'package:mobile_ui/widgets/no_account_text.dart';
import 'package:mobile_ui/widgets/small_text.dart';

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
                onTap: () => Navigator.pushNamed(
                    context, ForgotPassWordScreen.routeName),
                child: Text(
                  "Quên mật khẩu",
                  style: TextStyle(
                      color: AppColor.signColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font16),
                ),
              )
            ],
          ),
          SizedBox(height: Dimensions.number25),
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
                    text: "Đăng nhập",
                    size: Dimensions.font26,
                    color: Colors.white,
                  ),
                ),
              )),
          SizedBox(height: Dimensions.number15),
          NoAccountText(),
        ],
      ),
    );
  }
}
