import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/screens/account/account.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/app_text_field.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';

class ProfileSetUpForm extends StatefulWidget {
  const ProfileSetUpForm({Key? key}) : super(key: key);

  @override
  State<ProfileSetUpForm> createState() => _ProfileSetUpFormState();
}

class _ProfileSetUpFormState extends State<ProfileSetUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? fullname;
  String? email;
  String? password;
  TextEditingController fullNameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController addressText = TextEditingController();

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
          SizedBox(height: Dimensions.number30),
          AppTextField(
              textController: phoneText,
              hintText: "Điện thoại",
              icon: Icons.phone),
          SizedBox(height: Dimensions.number30),
          AppTextField(
              textController: emailText, hintText: "Email", icon: Icons.email),
          SizedBox(height: Dimensions.number30),
          AppTextField(
              textController: addressText,
              hintText: "Địa chỉ",
              icon: Icons.location_on),
          SizedBox(height: Dimensions.number30),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: Dimensions.screenHeight / 13,
              width: Dimensions.screenWidth / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.border30),
                  color: AppColor.mainColor),
              child: Center(
                child: BigText(
                  text: "Lưu",
                  size: Dimensions.font26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.number45),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              "Quay lại",
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
