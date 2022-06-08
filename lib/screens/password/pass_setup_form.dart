import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/user.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/screens/account/account.dart';
import 'package:mobile_ui/screens/account/account_menu.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/widgets/app_text_field.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:mobile_ui/shared_Preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PassSetUpForm extends StatefulWidget {
  const PassSetUpForm({Key? key}) : super(key: key);

  @override
  State<PassSetUpForm> createState() => _PassSetUpForm();
}

class _PassSetUpForm extends State<PassSetUpForm> {
  final _formKey = GlobalKey<FormState>();
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

  String? newPass;
  String? oldPass;
  String? confirmPass;
  TextEditingController OldPass = TextEditingController();
  TextEditingController NewPass = TextEditingController();
  TextEditingController ConfirmPass = TextEditingController();
  final List<String?> errors = [];
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
          SizedBox(height: Dimensions.number100),     
          buildNewPassFormField(),
          SizedBox(height: Dimensions.number100),  
          GestureDetector(
            onTap: () async {
              bool status = await UserController.updateUserPass(user);
              if (status) {
                _showCupertinoDialog(context, text: 'Cập nhật thành công!');
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
          SizedBox(height: Dimensions.number100 * 0.6),
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

 

  TextFormField buildNewPassFormField() {
    return TextFormField(
      controller: NewPass,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => newPass = newValue,
      onChanged: (value) {
        user.userPassword = value;
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
          hintText: "Mật khẩu mới",
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

  

  Future<void> _getData() async {
    var id = await BaseSharedPreferences.getString('user_id');
    user = await UserController.getUser(int.parse(id));
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
