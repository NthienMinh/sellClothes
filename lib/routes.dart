import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_ui/account/about.dart';
import 'package:mobile_ui/cart/cart_screen.dart';
import 'package:mobile_ui/clothes/recommanded_clothe_detail.dart';
import 'package:mobile_ui/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/forgot_password/forgot_password.dart';
import 'package:mobile_ui/home/home_page.dart';
import 'package:mobile_ui/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPassWordScreen.routeName: (context) => ForgotPassWordScreen(),
  Cartscreen.routeName: (context) => Cartscreen(),
  recommandedClotheDetail.routeName: (context) => recommandedClotheDetail(),
  PopularClotheDetail.routeName: (context) => PopularClotheDetail(),
  AboutScreen.routeName: (context) => AboutScreen(),
};
