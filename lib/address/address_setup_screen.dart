import 'package:flutter/material.dart';
import 'package:mobile_ui/address/body.dart';

class AddressSetUpScreen extends StatelessWidget {
  static String routeName = "/addressSetUpScreen";
  const AddressSetUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
