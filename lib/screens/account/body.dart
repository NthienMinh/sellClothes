import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/screens/account/about.dart';
import 'package:mobile_ui/screens/account/account_menu.dart';
import 'package:mobile_ui/screens/account/account_pic.dart';
import 'package:mobile_ui/screens/password/pass_setup_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/profile/profile_screen.dart';
import 'package:mobile_ui/screens/sign_in/sign_in_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: Dimensions.number20),
      child: Column(
        children: [
          AccountPic(),
          SizedBox(height: 20),
          AccountMenu(
            text: "Thông tin tài khoản",
            icon: Icons.person,
            press: () {
              Navigator.pushNamed(context, ProfileSetUpScreen.routeName);
            },
            color: AppColor.mainColor,
          ),
          AccountMenu(
            text: "Đổi mật khẩu",
            icon: Icons.vpn_key,
            press: () {
              Navigator.pushNamed(context, PassSetUpScreen.routeName);
            },
            color: AppColor.mainColor,
          ),
          AccountMenu(
            text: "Giới thiệu",
            icon: Icons.change_circle_sharp,
            press: () {
              Navigator.pushNamed(context, AboutScreen.routeName);
            },
            color: AppColor.mainColor,
          ),
          AccountMenu(
            text: "Đăng xuất",
            icon: Icons.exit_to_app,
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
