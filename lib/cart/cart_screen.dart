import 'package:flutter/material.dart';
import 'package:mobile_ui/cart/body.dart';

class Cartscreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
