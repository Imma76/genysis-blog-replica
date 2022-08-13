import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:genesys_blog/services/user.dart';

class UserController extends ChangeNotifier {
  String? message;
  bool load = false;

  Future signUpUser({
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    load = true;
    UserService _userService = UserService();
    try {
      final message = await _userService.signUpUser(
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName);
      load = false;
      notifyListeners();
      return message;
    } on SocketException {
      message = 'no internet connection';
    } catch (e) {
      print(e.toString());
    }
  }
  
}
