import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_ui/screens/account/about.dart';
import 'package:mobile_ui/screens/password/pass_setup_screen.dart';
import 'package:mobile_ui/screens/cart/cart_screen.dart';
import 'package:mobile_ui/screens/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/screens/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/screens/forgot_password/forgot_password.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/pay/pay_screen.dart';
import 'package:mobile_ui/screens/profile/profile_screen.dart';
import 'package:mobile_ui/screens/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/screens/sign_up/sign_up_screen.dart';

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
  CartScreen.routeName: (context) =>  CartScreen(),
  PayScreen.routeName: (context) => PayScreen(),
};
