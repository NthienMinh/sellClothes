import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_text_field.dart';
import 'package:mobile_ui/widgets/big_text.dart';

class AddressSetUpForm extends StatefulWidget {
  const AddressSetUpForm({Key? key}) : super(key: key);

  @override
  State<AddressSetUpForm> createState() => _AddressSetUpForm();
}

class _AddressSetUpForm extends State<AddressSetUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController addressNumber = TextEditingController();
  TextEditingController addressStreet = TextEditingController();
  TextEditingController addressDitrict = TextEditingController();
  TextEditingController addressCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
              textController: addressNumber,
              hintText: "Số nhà",
              icon: Icons.home),
          SizedBox(height: Dimensions.number30),
          AppTextField(
              textController: addressStreet,
              hintText: "Đường",
              icon: Icons.streetview_outlined),
          SizedBox(height: Dimensions.number25),
          AppTextField(
              textController: addressDitrict,
              hintText: "Quận",
              icon: Icons.share_location),
          SizedBox(height: Dimensions.number25),
          AppTextField(
              textController: addressCity,
              hintText: "Thành phố",
              icon: Icons.location_city),
          SizedBox(height: Dimensions.number25),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: Dimensions.screenHeight / 13,
              width: Dimensions.screenWidth / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.border30),
                  color: AppColor.mainColor),
              child: Center(
                child: BigText(
                  text: "Lưu",
                  size: Dimensions.font26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.number45),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              "Quay lại",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.number15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
