import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';

class TextWidget extends StatefulWidget {
  final String text;
  const TextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.6;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              color: AppColor.paraColor,
              size: Dimensions.font16,
              text: firstHalf)
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmallText(
                    height: 1.8,
                    color: AppColor.paraColor,
                    size: Dimensions.font16,
                    text: hiddenText
                        ? (firstHalf + "...")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      hiddenText
                          ? SmallText(
                              text: "Xem thêm",
                              color: AppColor.mainColor,
                              size: Dimensions.number15,
                            )
                          : SmallText(
                              text: "Rút gọn",
                              color: AppColor.mainColor,
                              size: Dimensions.number15,
                            ),
                      Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColor.mainColor)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
