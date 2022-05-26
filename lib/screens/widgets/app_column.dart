import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';

import 'big_text.dart';
import 'icon_and_text_widgets.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.number10),
        SmallText(text: "Chất liệu thân thiện với môi trường"),
        SizedBox(height: Dimensions.number10),
        Row(
          children: [
            SizedBox(width: Dimensions.number15),
            IconAndTextWidget(
                icon: Icons.checkroom, iconColor: Colors.black, text: "Cotton"),
            SizedBox(width: Dimensions.number70),
            IconAndTextWidget(
                icon: Icons.location_on,
                iconColor: AppColor.mainColor,
                text: "Hồ Chí Minh")
          ],
        )
      ],
    );
  }
}
