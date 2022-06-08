import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/screens/widgets/app_text_field.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';

class ForgotPassWordForm extends StatefulWidget {
  @override
  _ForgotPassWordFormState createState() => _ForgotPassWordFormState();
}

class _ForgotPassWordFormState extends State<ForgotPassWordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  final List<String?> errors = [];

  TextEditingController emailText = TextEditingController();
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: Dimensions.number70 - Dimensions.number15),
          // AppTextField(
          //     textController: emailText, hintText: "Email", icon: Icons.email),
          buildForgotEmailFormField(),
          SizedBox(height: Dimensions.number70),
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
              child: Container(
                height: Dimensions.screenHeight / 13,
                width: Dimensions.screenWidth / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.border30),
                    color: AppColor.mainColor),
                child: Center(
                  child: BigText(
                    text: "Tiếp tục",
                    size: Dimensions.font26,
                    color: Colors.white,
                  ),
                ),
              )),
          SizedBox(height: Dimensions.number85),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
            child: Text(
              "Quay lại",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.number7 * 2),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildForgotEmailFormField() {
    return TextFormField(
        controller: emailText,
        keyboardType: TextInputType.name,
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: Dimensions.kNamelNullError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: Dimensions.kNamelNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "Email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(Icons.person, color: AppColor.mainColor),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12, width: 2.0),
              borderRadius: BorderRadius.circular(Dimensions.number15),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.border15),
                borderSide: BorderSide(width: 1.0, color: Colors.black12)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.border15),
                borderSide: BorderSide(width: 1.0, color: Colors.black12))));
  }
}
