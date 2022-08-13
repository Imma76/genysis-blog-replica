import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:genesys_blog/services/user.dart';

class UserController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  String? message;
  bool load = false;
  //S? userModel;
  bool validateSignUp() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      message = 'make sure all fields are complete';
      notifyListeners();
      return false;
    }
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      message = 'passwords do not match';
        notifyListeners();
      return false;
    }
    return true;
  }

  Future<bool> signUpUser() async {
    load = true;
    UserService _userService = UserService();
    try {
      final uMessage = await _userService.signUpUser(
          password: passwordController.text.trim(),
          email: emailController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim());
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

  Future<bool> loginUser() async {
    load = true;
    UserService _userService = UserService();
    try {
      message = await _userService.loginUser(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
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
