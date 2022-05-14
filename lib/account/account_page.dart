import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/account_widget.dart';
import 'package:mobile_ui/widgets/app_icon.dart';
import 'package:mobile_ui/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: BigText(
          text: "Tài khoản",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.number20),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.number100 * 1.5,
              width: Dimensions.number100 * 1.5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/image/meo.png"),
                  ),
                ],
              ),
            ),

            // AppIcon(
            //   icon: Icons.person,
            //   backgroundColor: AppColor.mainColor,
            //   size: Dimensions.number100 * 1.15,
            //   iconColor: Colors.white,
            //   iconSize: Dimensions.number70,
            // ),
            SizedBox(height: Dimensions.number25),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColor.mainColor,
                          size: Dimensions.number45,
                          iconColor: Colors.white,
                          iconSize: Dimensions.number24,
                        ),
                        bigText: BigText(
                          text: "Nguyễn Thiên Minh",
                        )),
                    SizedBox(height: Dimensions.number10),
                    //SĐT
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          backgroundColor: AppColor.mainColor,
                          size: Dimensions.number45,
                          iconColor: Colors.white,
                          iconSize: Dimensions.number24,
                        ),
                        bigText: BigText(
                          text: "0902662247",
                        )),
                    SizedBox(height: Dimensions.number10),
                    //Email
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email,
                          backgroundColor: AppColor.mainColor,
                          size: Dimensions.number45,
                          iconColor: Colors.white,
                          iconSize: Dimensions.number24,
                        ),
                        bigText: BigText(
                          text: "nthienminh3001@gmail.com",
                        )),
                    SizedBox(height: Dimensions.number10),
                    //Địa chỉ
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColor.mainColor,
                          size: Dimensions.number45,
                          iconColor: Colors.white,
                          iconSize: Dimensions.number24,
                        ),
                        bigText: BigText(
                          text: "Địa chỉ",
                        )),
                    SizedBox(height: Dimensions.number10),
                    //Giới thiệu
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.question_mark,
                          backgroundColor: AppColor.mainColor,
                          size: Dimensions.number45,
                          iconColor: Colors.white,
                          iconSize: Dimensions.number24,
                        ),
                        bigText: BigText(
                          text: "Giới thiệu",
                        )),
                    SizedBox(height: Dimensions.number10),
                    //Đăng xuất
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.exit_to_app,
                          backgroundColor: Colors.red,
                          size: Dimensions.number45,
                          iconColor: Colors.white,
                          iconSize: Dimensions.number24,
                        ),
                        bigText: BigText(
                          text: "Đăng xuất",
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
