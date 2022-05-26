import 'package:flutter/material.dart';
import 'package:mobile_ui/screens/password/body.dart';

class PassSetUpScreen extends StatelessWidget {
  static String routeName = "/passSetUpScreen";
  const PassSetUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
