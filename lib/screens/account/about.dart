import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';

class AboutScreen extends StatelessWidget {
  static String routeName = "/about";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Text(
          "Thông tin về chúng tôi"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.number20),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: AppColor.kSecondaryColor,
                  padding: EdgeInsets.all(Dimensions.number20),
                ),
                onPressed: () => {},
                child: Text(
                  'GIỚI THIỆU VỀ ỨNG DỤNG',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Dimensions.font20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.number20),
              child: Text(
                'Ứng dụng được phát triển bởi team dev FTeam\nĐây là một ứng dụng giúp bạn dễ dàng đặt những bộ quần áo thời trang từ cửa hàng của chúng tôi',
                textAlign: TextAlign.justify,
                style: TextStyle(height: Dimensions.number20 / 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
