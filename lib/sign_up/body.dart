import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/sign_up/sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.number20),
            Container(
              width: double.maxFinite,
              height: Dimensions.number45 + Dimensions.number10,
              child: Column(
                children: [
                  Text(
                    "FTEAM SHOP",
                    style: TextStyle(
                        fontSize: Dimensions.font20 * 2,
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.number15),
            SignUpForm(),
            SizedBox(height: Dimensions.number45),
            Text(
              "@Ứng dụng được phát triển bởi nhóm FTeam",
              style: TextStyle(color: AppColor.paraColor),
            )
          ],
        ),
      ),
    );
  }
}
