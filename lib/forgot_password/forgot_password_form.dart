import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/home/home_page.dart';
import 'package:mobile_ui/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/widgets/app_text_field.dart';
import 'package:mobile_ui/widgets/big_text.dart';

class ForgotPassWordForm extends StatefulWidget {
  @override
  _ForgotPassWordFormState createState() => _ForgotPassWordFormState();
}

class _ForgotPassWordFormState extends State<ForgotPassWordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;

  TextEditingController emailText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: Dimensions.number70 - Dimensions.number15),
          AppTextField(
              textController: emailText, hintText: "Email", icon: Icons.email),
          SizedBox(height: Dimensions.number70),
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
                    text: "Tiếp tục",
                    size: Dimensions.font26,
                    color: Colors.white,
                  ),
                ),
              )),
          SizedBox(height: Dimensions.number85),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
            child: Text(
              "Quay lại",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.number7 * 2),
            ),
          ),
        ],
      ),
    );
  }
}
