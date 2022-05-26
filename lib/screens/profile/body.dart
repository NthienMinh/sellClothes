import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/profile/profile_setup_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Dimensions.number70),
          Container(
            width: double.maxFinite,
            height: Dimensions.number45 + Dimensions.number10,
            child: Column(
              children: [
                Text(
                  "Cập nhật thông tin",
                  style: TextStyle(
                      fontSize: Dimensions.font20 * 2,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.number45),
          ProfileSetUpForm(),
        ],
      ),
    );
  }
}
