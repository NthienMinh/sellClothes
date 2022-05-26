import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/screens/history/history_form.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.mainColor,
          title: BigText(
            text: "Lịch sử mua hàng",
            size: 24,
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
        ),
        body: HistoryForm());
  }
}
