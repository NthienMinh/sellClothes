import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/account/account.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/widgets/app_text_field.dart';
import 'package:mobile_ui/widgets/big_text.dart';

class InforPayForm extends StatefulWidget {
  const InforPayForm({Key? key}) : super(key: key);

  @override
  State<InforPayForm> createState() => _InforPayFormState();
}

class _InforPayFormState extends State<InforPayForm> {
  final _formKey = GlobalKey<FormState>();
  String? fullname;
  String? email;
  String? password;
  TextEditingController fullNameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController addressText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
              textController: fullNameText,
              hintText: "Tên",
              icon: Icons.person),
          SizedBox(height: Dimensions.number20),
          AppTextField(
              textController: phoneText,
              hintText: "Điện thoại",
              icon: Icons.phone),
          SizedBox(height: Dimensions.number20),
          AppTextField(
              textController: addressText,
              hintText: "Địa chỉ",
              icon: Icons.location_on),
        ],
      ),
    );
  }
}
