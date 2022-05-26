import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;

  const AppTextField(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: Dimensions.number15, right: Dimensions.number15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.border20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ]),
        child: TextField(
            controller: textController,
            decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(icon, color: AppColor.mainColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(Dimensions.number15),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.border15),
                    borderSide: BorderSide(width: 1.0, color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.border15),
                    borderSide: BorderSide(width: 1.0, color: Colors.white)))));
  }
}
