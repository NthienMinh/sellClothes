import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_ui/home/home_page.dart';
import 'package:mobile_ui/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};
