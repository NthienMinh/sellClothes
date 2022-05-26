import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/app_icon.dart';

class AccountMenu extends StatelessWidget {
  const AccountMenu(
      {Key? key,
      required this.text,
      required this.icon,
      this.press,
      required this.color})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback? press;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.number20, vertical: Dimensions.number7),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: AppColor.signColor,
          padding: EdgeInsets.all(Dimensions.number10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            AppIcon(
                icon: icon,
                backgroundColor: color,
                size: Dimensions.number45,
                iconColor: Colors.white,
                iconSize: Dimensions.number24),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
