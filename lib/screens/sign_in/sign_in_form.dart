import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/login.dart';
import 'package:mobile_ui/helper/keyboard.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/screens/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/screens/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/forgot_password/forgot_password.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/main_screen/popular_product.dart';
import 'package:mobile_ui/screens/sign_up/sign_up_screen.dart';
import 'package:mobile_ui/screens/widgets/app_text_field.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/no_account_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

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
          buildEmailFormField(),
          SizedBox(height: Dimensions.number25),
          buildPasswordFormField(),
          SizedBox(height: Dimensions.number25),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: AppColor.mainColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              SmallText(
                text: "Ghi nhớ",
                size: Dimensions.font16,
                color: AppColor.mainBlackColor,
              ),
              SizedBox(width: Dimensions.number100),
              // GestureDetector(
              //   onTap: () => Navigator.pushNamed(
              //       context, ForgotPassWordScreen.routeName),
              //   child: Text(
              //     "Quên mật khẩu",
              //     style: TextStyle(
              //         color: AppColor.signColor,
              //         fontWeight: FontWeight.bold,
              //         fontSize: Dimensions.font16),
              //   ),
              // )
            ],
          ),
          SizedBox(height: Dimensions.number25),
          GestureDetector(
              onTap: () async {
                print(_formKey.currentState!.validate());
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to success screen
                  KeyboardUtil.hideKeyboard(context);
                  User? user =
                      await fetchLogin(emailText.text, passwordText.text);

                  if (user != null) {
                    saveLogin(user);
                    removeError(error: 'Sai email hoặc mật khẩu!');
                    Navigator.pushNamed(context, HomePage.routeName);
                  } else
                    addError(error: 'Sai email hoặc mật khẩu!');
                }
              },
              child: Container(
                height: Dimensions.screenHeight / 13,
                width: Dimensions.screenWidth / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.border30),
                    color: AppColor.mainColor),
                child: Center(
                  child: BigText(
                    text: "Đăng nhập",
                    size: Dimensions.font26,
                    color: Colors.white,
                  ),
                ),
              )),
          SizedBox(height: Dimensions.number15),
          NoAccountText(),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailText,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Dimensions.kInvalidEmailError);
        } else if (Dimensions.emailValidatorRegExp.hasMatch(value)) {
          removeError(error: Dimensions.kInvalidEmailError);
        }
        //return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Dimensions.kEmailNullError);
          return "";
        } else if (!Dimensions.emailValidatorRegExp.hasMatch(value)) {
          addError(error: Dimensions.kInvalidEmailError);
          return "";
        }

        //return null;
      },
      decoration: InputDecoration(
          hintText: "Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(Icons.email, color: AppColor.mainColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12, width: 2.0),
            borderRadius: BorderRadius.circular(Dimensions.number15),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.border15),
              borderSide: BorderSide(width: 1.0, color: Colors.black12)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.border15),
              borderSide: BorderSide(width: 1.0, color: Colors.black12))),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordText,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Dimensions.kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: Dimensions.kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Dimensions.kPassNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: Dimensions.kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Mật khẩu",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(Icons.key, color: AppColor.mainColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12, width: 2.0),
            borderRadius: BorderRadius.circular(Dimensions.number15),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.border15),
              borderSide: BorderSide(width: 1.0, color: Colors.black12)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.border15),
              borderSide: BorderSide(width: 1.0, color: Colors.black12))),
    );
  }
}
