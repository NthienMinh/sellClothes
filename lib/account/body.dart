import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/account/about.dart';
import 'package:mobile_ui/account/account_menu.dart';
import 'package:mobile_ui/account/account_pic.dart';
import 'package:mobile_ui/password/pass_setup_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/profile/profile_screen.dart';
import 'package:mobile_ui/sign_in/sign_in_screen.dart';

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
            color: Color(0xFF9F8F80),
          ),
          AccountMenu(
            text: "Đổi mật khẩu",
            icon: Icons.vpn_key,
            press: () {
              Navigator.pushNamed(context, PassSetUpScreen.routeName);
            },
            color: Color(0xFF9F8F80),
          ),
          AccountMenu(
            text: "Giới thiệu",
            icon: Icons.change_circle_sharp,
            press: () {
              Navigator.pushNamed(context, AboutScreen.routeName);
            },
            color: Color(0xFF9F8F80),
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
