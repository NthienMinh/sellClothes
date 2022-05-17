import 'package:flutter/material.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/sign_up/sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [SignUpForm()],
      ),
    );
  }
}
