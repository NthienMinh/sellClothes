import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/user.dart';

import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/helper/keyboard.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/screens/widgets/app_text_field.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  User user = User();
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
       setState(() {}); 
    });
    _controller = PersistentTabController(initialIndex: 0);
  }

  final _formKey = GlobalKey<FormState>();
  String? fullname;
  String? email;
  String? password;
  String? address;
  String? phone;
  final List<String?> errors = [];
  TextEditingController fullNameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passWordText = TextEditingController();
  TextEditingController addressText = TextEditingController();
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
          buildFullnameFormField(),
          SizedBox(height: Dimensions.number15),
          buildEmailFormField(),
          SizedBox(height: Dimensions.number15),
          buildPasswordFormField(),
          SizedBox(height: Dimensions.number15),
          buildPhoneFormField(),
          SizedBox(height: Dimensions.number15),
          buildAddressFormField(),
          SizedBox(height: Dimensions.number20),
          GestureDetector(
             onTap: () async {
              bool status = await UserController.addUser(user);
              if (status) {
                _showCupertinoDialog(context, text: 'Tạo tài khoản thành công!');
              } else
                _showCupertinoDialog(context,
                    text: 'Tạo tài khoản không thành công!');
            },
            child: Container(
              height: Dimensions.screenHeight / 13,
              width: Dimensions.screenWidth / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.border30),
                  color: AppColor.mainColor),
              child: Center(
                child: BigText(
                  text: "Đăng kí",
                  size: Dimensions.font26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.number20),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
            child: Text(
              "Đã có tài khoản?",
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

  TextFormField buildFullnameFormField() {
    return TextFormField(
        controller: fullNameText,
        keyboardType: TextInputType.name,
        onSaved: (newValue) => fullname = newValue,
        onChanged: (value) {
          user.userFullName = value;
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
            hintText: "Họ tên",
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

TextFormField buildAddressFormField() {
    return TextFormField(
        controller: addressText,
        keyboardType: TextInputType.name,
        onSaved: (newValue) => address = newValue,
        onChanged: (value) {
          user.userAdress = value;
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
            hintText: "Địa chỉ",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(Icons.location_on, color: AppColor.mainColor),
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
  TextFormField buildPhoneFormField() {
    return TextFormField(
        controller: phoneText,
        keyboardType: TextInputType.name,
        onSaved: (newValue) => phone = newValue,
        onChanged: (value) {
          user.userPhoneNumber = value;
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
            hintText: "Điện thoại",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(Icons.phone, color: AppColor.mainColor),
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
  

  TextFormField buildPasswordFormField() {
    return TextFormField(
        controller: passWordText,
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          user.userPassword = value;
          if (value.isNotEmpty) {
            removeError(error: Dimensions.kPassNullError);
          } else if (value.length >= 6) {
            removeError(error: Dimensions.kShortPassError);
          }
          password = value;
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
                borderSide: BorderSide(width: 1.0, color: Colors.black12))));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        controller: emailText,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          user.userEmail = value;
          if (value.isNotEmpty) {
            removeError(error: Dimensions.kEmailNullError);
          } else if (Dimensions.emailValidatorRegExp.hasMatch(value)) {
            removeError(error: Dimensions.kInvalidEmailError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: Dimensions.kEmailNullError);
            return "";
          } else if (!Dimensions.emailValidatorRegExp.hasMatch(value)) {
            addError(error: Dimensions.kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "Email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(Icons.mail, color: AppColor.mainColor),
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
  _dismissDialog(BuildContext context) {
  Navigator.popAndPushNamed(context, SignInScreen.routeName);
}

void _showCupertinoDialog(BuildContext context, {required String text}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: BigText(
            text: text,
            color: AppColor.mainBlackColor,
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: SmallText(
                  text: 'Đóng',
                  color: AppColor.mainColor,
                )),
          ],
        );
      });
}
}
