import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:genesys_blog/services/user.dart';

import '../models/user_model.dart';

class UserController extends ChangeNotifier {
  String? message;
  bool load = false;
  //S? userModel;

  Future<bool> signUpUser({
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    load = true;
    UserService _userService = UserService();
    try {
      final uMessage = await _userService.signUpUser(
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName);
      message = uMessage;
      load = false;
      notifyListeners();
      return true;
    } on SocketException {
      message = 'no internet connection';
      return false;
    } catch (e) {
      message = e.toString();
      return false;
    }
  }

  Future<bool> loginUser({
    required String password,
    required String email,
  }) async {
    load = true;
    UserService _userService = UserService();
    try {
      message = await _userService.loginUser(
        password: password,
        email: email,
      );
      load = false;
      notifyListeners();
      return true;
    } on SocketException {
      message = 'no internet connection';
      return false;
    } catch (e) {
      message = e.toString();

      return false;
    }
  }
}
