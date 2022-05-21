import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Dimensions.number100 * 0.9,
      width: double.infinity,
      margin: EdgeInsets.all(Dimensions.number20),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.number20,
        vertical: Dimensions.number15,
      ),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "FTeam Shop\n"),
            TextSpan(
              text: "Tiện lợi, nhanh chóng!",
              style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
