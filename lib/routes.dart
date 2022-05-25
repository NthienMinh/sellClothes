import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_ui/account/about.dart';
import 'package:mobile_ui/password/pass_setup_screen.dart';
import 'package:mobile_ui/cart/cart_screen.dart';
import 'package:mobile_ui/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/cart_no_data/no_data_page.dart';
import 'package:mobile_ui/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/forgot_password/forgot_password.dart';
import 'package:mobile_ui/home/home_page.dart';
import 'package:mobile_ui/profile/profile_screen.dart';
import 'package:mobile_ui/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => const HomePage(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPassWordScreen.routeName: (context) => ForgotPassWordScreen(),
  CartHistoryscreen.routeName: (context) => CartHistoryscreen(),
  PopularClotheDetail.routeName: (context) => const PopularClotheDetail(),
  AboutScreen.routeName: (context) => AboutScreen(),
  ProfileSetUpScreen.routeName: (context) => const ProfileSetUpScreen(),
  PassSetUpScreen.routeName: (context) => const PassSetUpScreen(),
  NoDataPage.routeName: (context) => const NoDataPage(),
  CartScreen.routeName: (context) => const CartScreen(),
};
