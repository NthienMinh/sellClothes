import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/models/user.dart';

class UserController {
  UserController._();
  static Future<User> getUser(int user_id) async {
    String userAdd = "/user";
    Map<String, dynamic> param = {'user_id': user_id.toString()};
    BaseAPI _baseAPI = BaseAPI();
    var res = await _baseAPI.getData(userAdd, params: param);
    if (res.apiStatus == API_STATUS.SUSSCESSED) {
      return User.fromJson(res.object[0]);
    }
    return User();
  }

  static Future<bool> updateUser(User user) async {
    String updateUser = "/updateUser";
    BaseAPI _baseAPI = BaseAPI();
    Map<String, dynamic> body = {
      'user_full_name': user.userFullName,
      'user_email': user.userEmail,
      'user_phone_number': user.userPhoneNumber,
      'user_adress': user.userAdress,
      'user_id': user.userId
    };
    var res = await _baseAPI.postData(updateUser, body: body);
    if (res.apiStatus == API_STATUS.SUSSCESSED) {
      return true;
    }
    return false;
  }

  static Future<bool> updateUserPass(User user) async {
    String updateUserPass = "/updateUserPass";
    BaseAPI _baseAPI = BaseAPI();
    Map<String, dynamic> body = {
      'user_password': user.userPassword,
      'user_id': user.userId
    };
    var res = await _baseAPI.postData(updateUserPass, body: body);
    if (res.apiStatus == API_STATUS.SUSSCESSED) {
      return true;
    }
    return false;
  }
  static Future<bool> addUser(User user) async {
    String addUser = "/addUser";
    BaseAPI _baseAPI = BaseAPI();
    Map<String, dynamic> body = {
      'user_full_name': user.userFullName,
      'user_email': user.userEmail,
      'user_password': user.userPassword,
      'user_phone_number': user.userPhoneNumber,
      'user_address':user.userAdress
    };
    var res = await _baseAPI.postData(addUser, body: body);
    if (res.apiStatus == API_STATUS.SUSSCESSED) {
      return true;
    }
    return false;
  }
}
