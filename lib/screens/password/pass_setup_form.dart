import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/app_text_field.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';

class PassSetUpForm extends StatefulWidget {
  const PassSetUpForm({Key? key}) : super(key: key);

  @override
  State<PassSetUpForm> createState() => _PassSetUpForm();
}

class _PassSetUpForm extends State<PassSetUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController OldPass = TextEditingController();
  TextEditingController NewPass = TextEditingController();
  TextEditingController ConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
              textController: OldPass,
              hintText: "Mật khẩu cũ",
              icon: Icons.vpn_key),
          SizedBox(height: Dimensions.number30),
          AppTextField(
              textController: NewPass,
              hintText: "Mật khẩu mới",
              icon: Icons.vpn_key),
          SizedBox(height: Dimensions.number25),
          AppTextField(
              textController: ConfirmPass,
              hintText: "Xác nhận mật khẩu",
              icon: Icons.vpn_key),
          SizedBox(height: Dimensions.number40),
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
          SizedBox(height: Dimensions.number100),
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
