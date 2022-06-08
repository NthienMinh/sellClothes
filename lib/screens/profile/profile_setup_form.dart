import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/base_api.dart';

import 'package:mobile_ui/controller/user.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/screens/account/account.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/profile/profile_screen.dart';
import 'package:mobile_ui/screens/widgets/app_text_field.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:mobile_ui/shared_Preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ProfileSetUpForm extends StatefulWidget {
  const ProfileSetUpForm({Key? key}) : super(key: key);

  @override
  State<ProfileSetUpForm> createState() => _ProfileSetUpFormState();
}

class _ProfileSetUpFormState extends State<ProfileSetUpForm> {
  User user = User();
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _getData();
    });
    _controller = PersistentTabController(initialIndex: 0);
  }

  final _formKey = GlobalKey<FormState>();
  String? fullname;
  String? email;
  String? address;
  String? phone;
  final List<String?> errors = [];
  TextEditingController fullNameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController emailText = TextEditingController();
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
          // AppTextField(
          //     textController: fullNameText,
          //     hintText: "Tên",
          //     icon: Icons.person),
          buildNameFormField(),
          SizedBox(height: Dimensions.number25),
          // AppTextField(
          //     textController: phoneText,
          //     hintText: "Điện thoại",
          //     icon: Icons.phone),
          buildPhoneFormField(),
          SizedBox(height: Dimensions.number25),
          // AppTextField(
          //     textController: emailText, hintText: "Email", icon: Icons.email),
          buildEmailFormField(),
          SizedBox(height: Dimensions.number25),
          // AppTextField(
          //     textController: addressText,
          //     hintText: "Địa chỉ",
          //     icon: Icons.location_on),
          buildLocationFormField(),
          SizedBox(height: Dimensions.number25),
          GestureDetector(
            onTap: () async {
              bool status = await UserController.updateUser(user);
              if (status) {
                _showCupertinoDialog(context, text: 'Cập nhật thành công!');
                _getData();
              } else
                _showCupertinoDialog(context,
                    text: 'Cập nhật không thành công!');
            },
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
          SizedBox(height: Dimensions.number30),
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

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: fullNameText,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => fullname = newValue,
      onChanged: (value) {
        user.userFullName = value;
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
          hintText: "Tên",
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
              borderSide: BorderSide(width: 1.0, color: Colors.black12))),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      controller: phoneText,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        user.userPhoneNumber = value;
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
              borderSide: BorderSide(width: 1.0, color: Colors.black12))),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailText,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        user.userEmail = value;
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

  TextFormField buildLocationFormField() {
    return TextFormField(
      controller: addressText,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        user.userAdress = value;
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
              borderSide: BorderSide(width: 1.0, color: Colors.black12))),
    );
  }

  Future<void> _getData() async {
    var id = await BaseSharedPreferences.getString('user_id');
    user = await UserController.getUser(int.parse(id));
    fullNameText.text = user.userFullName ?? '';
    phoneText.text = user.userPhoneNumber ?? '';
    emailText.text = user.userEmail ?? '';
    addressText.text = user.userAdress ?? '';
    fullname = user.userFullName ?? '';
    phone = user.userPhoneNumber ?? '';
    email = user.userEmail ?? '';
    address = user.userAdress ?? '';
    setState(() {});
  }
}

_dismissDialog(BuildContext context) {
  Navigator.popAndPushNamed(context, HomePage.routeName);
}

void _showCupertinoDialog(BuildContext context, {required String text}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: BigText(
            text: text,
            color: AppColor.mainBlackColor,
            size: Dimensions.number15,
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
