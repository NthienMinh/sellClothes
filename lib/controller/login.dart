import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/shared_Preferences.dart';

Future<User?> fetchLogin(String email, String password) async {
  BaseAPI _baseAPI = BaseAPI();
  var map = new Map<String, dynamic>();
  map['user_email'] = email;
  map['user_password'] = password;
  final response = await _baseAPI.postData('/login', body: map);

  if (response.apiStatus == API_STATUS.SUSSCESSED) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return User.fromJson(response.object[0]);
    // }
  }
}

Future<bool> saveLogin(User user) async {
  await BaseSharedPreferences.setString('user_id', user.userId.toString());
  await BaseSharedPreferences.setString(
      'user_fullname', user.userFullName ?? '');
  await BaseSharedPreferences.setString('user_email', user.userEmail ?? '');
  await BaseSharedPreferences.setString(
      'user_password', user.userPassword ?? '');
  return true;
}
