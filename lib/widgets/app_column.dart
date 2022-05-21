import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/widgets/small_text.dart';

import '../Colors.dart';
import '../dimensions.dart';
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
        // Row(
        //   children: [
        //     Wrap(
        //       children: List.generate(
        //           5,
        //           (index) => Icon(
        //                 Icons.star,
        //                 color: AppColor.mainColor,
        //                 size: Dimensions.number15,
        //               )),
        //     ),
        //     SizedBox(width: Dimensions.number5),
        //     SmallText(text: "4.5"),
        //     SizedBox(width: Dimensions.number7),
        //     SmallText(text: "1256"),
        //     SizedBox(width: Dimensions.number5),
        //     SmallText(text: "Lượt mua")
        //   ],
        // ),
        SizedBox(height: Dimensions.number10),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IconAndTextWidget(
            //     icon: Icons.auto_awesome,
            //     iconColor: Colors.redAccent,
            //     text: "Yêu thích"),
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
