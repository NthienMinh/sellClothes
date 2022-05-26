import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Chưa có tài khoản? ",
          style: TextStyle(
              color: Colors.grey[500],
              fontSize: Dimensions.number7 + Dimensions.number5),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Đăng ký ngay",
            style: TextStyle(
                color: AppColor.mainBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.number7 * 2),
          ),
        ),
      ],
    );
  }
}
