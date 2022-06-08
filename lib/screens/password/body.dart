import 'package:flutter/cupertino.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/screens/password/pass_setup_form.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/profile/profile_setup_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Dimensions.number45),
          Container(
            width: double.maxFinite,
            height: Dimensions.number45 + Dimensions.number10,
            child: Column(
              children: [
                Text(
                  "Thay đổi mật khẩu",
                  style: TextStyle(
                      fontSize: Dimensions.font20 * 2,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.number45),
          PassSetUpForm(),
          SizedBox(height: Dimensions.number100 * 0.65),
          Text(
            "@Ứng dụng được phát triển bởi nhóm FTeam",
            style: TextStyle(color: AppColor.paraColor),
          )
        ],
      ),
    );
  }
}
