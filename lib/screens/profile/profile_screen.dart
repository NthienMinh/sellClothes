import 'package:flutter/material.dart';
import 'package:mobile_ui/screens/profile/body.dart';

class ProfileSetUpScreen extends StatelessWidget {
  static String routeName = "/profileSetUpScreen";
  const ProfileSetUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
