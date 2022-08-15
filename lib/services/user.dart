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

      UserModel _userModel = UserModel.fromJson(
        decode['body']['data'],
      );
      await UserSharedPref.storeUser(
          email: _userModel.email.toString(),
          firstName: _userModel.firstName.toString(),
          lastName: _userModel.lastName.toString(),
          token: decode['body']['token'],
          image: _userModel.photo.toString());
      return decode;
    } catch (e) {
      return e.toString();
    }
  }

  Future getUserPosts() async {
    try {
      UserModel _userData = await UserSharedPref.getUser();
      var response = await http.get(
        Uri.parse(baseUrl + 'post/id/${_userData.userId}'),
      );
      var decode = jsonDecode(response.body);

      UserModel _userModel = UserModel.fromJson(
        decode['body']['data'],
      );
      await UserSharedPref.storeUser(
          email: _userModel.email.toString(),
          firstName: _userModel.firstName.toString(),
          lastName: _userModel.lastName.toString(),
          token: decode['body']['token'],
          image: _userModel.photo.toString());
      return decode;
    } catch (e) {
      return e.toString();
    }
  }
}
