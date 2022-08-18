import 'dart:convert';

import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/models/user_model.dart';
import 'package:genesys_blog/utils/user_details.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<String?> signUpUser({
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    try {
      Map body = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };
      var response = await http.post(Uri.parse(baseUrl + 'users'), body: body);
      var decode = jsonDecode(response.body);
      return decode['message'];
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future loginUser({
    required String password,
    required String email,
  }) async {
    try {
      Map body = {
        'email': email,
        'password': password,
      };
      var response =
          await http.post(Uri.parse(baseUrl + 'users/login'), body: body);
      var decode = jsonDecode(response.body);
      print(decode);
      if (decode['message'] == 'user does not exist' || decode['message'] ==  'email or password is invalid') {
        return decode;
      }
      UserModel _userModel =
          UserModel.fromJson(decode['body']['data'], decode['body']['token']);
      await UserSharedPref.storeUser(
          email: _userModel.email.toString(),
          firstName: _userModel.firstName.toString(),
          lastName: _userModel.lastName.toString(),
          token: decode['body']['token'],
          image: _userModel.photo.toString(),
          userId: _userModel.userId.toString());
      return decode;
    } catch (e) {
      return e.toString();
    }
  }
}
