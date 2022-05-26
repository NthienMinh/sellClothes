import 'package:flutter/material.dart';
import 'package:mobile_ui/dimensions.dart';

class AccountPic extends StatelessWidget {
  const AccountPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.number100 + Dimensions.number25,
      width: Dimensions.number100 + Dimensions.number25,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/image/meo.png"),
          ),
        ],
      ),
    );
  }
}
