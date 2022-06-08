import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/user.dart';

import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/shared_Preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class InforPayForm extends StatefulWidget {
  const InforPayForm({Key? key}) : super(key: key);

  @override
  State<InforPayForm> createState() => _InforPayFormState();
}

class _InforPayFormState extends State<InforPayForm> {
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
  String? phone;
  String? address;
  final List<String?> errors = [];
  TextEditingController fullNameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
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
          SizedBox(height: Dimensions.number20),
          // AppTextField(
          //     textController: phoneText,
          //     hintText: "Điện thoại",
          //     icon: Icons.phone),
          buildPhoneFormField(),
          SizedBox(height: Dimensions.number20),
          // AppTextField(
          //     textController: addressText,
          //     hintText: "Địa chỉ",
          //     icon: Icons.location_on),
          buildLocationFormField(),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: fullNameText,
      onSaved: (newValue) => fullname = newValue,
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
      onSaved: (newValue) => phone = newValue,
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

  TextFormField buildLocationFormField() {
    return TextFormField(
      controller: addressText,
      onSaved: (newValue) => address = newValue,
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
    addressText.text = user.userAdress ?? '';
    fullname = user.userFullName ?? '';
    phone = user.userPhoneNumber ?? ''; 
    address = user.userAdress ?? '';
    setState(() {});
  }
}
