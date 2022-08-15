import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genesys_blog/services/user.dart';
import 'package:genesys_blog/utils/user_details.dart';
import 'package:genesys_blog/views/desktop_view/authentication_view/sign_in.dart';
import 'package:genesys_blog/views/desktop_view/desktop_view_home_page.dart';

import '../models/user_model.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class UserProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  String? message;
  bool load = false;
  String? firstName;
  String? token;
  String? lastName;
  String? email;
  String? photo;
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
    if (emailController.text.trim().isValidEmail() == false) {
      print('true');
      message = 'enter a valid email';
      notifyListeners();
      return false;
    }
    return true;
  }

  bool validateSignIn() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      message = 'make sure all fields are complete';
      notifyListeners();
      return false;
    }

    return true;
  }
  void getUserPosts()async{
    
  }

  void init() async {
    UserModel _userModel = await UserSharedPref.getUser();
    firstName = _userModel.firstName;
    lastName = _userModel.lastName;
    email = _userModel.email;
    token = _userModel.token;
    photo = _userModel.photo;
  }

  Future<bool> signUpUser(context) async {
    UserService _userService = UserService();
    try {
      load = true;
      notifyListeners();
      final uMessage = await _userService.signUpUser(
          password: passwordController.text.trim(),
          email: emailController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim());
      message = uMessage;
      load = false;
      notifyListeners();
      if (message == 'user created successfully') {
        emailController.clear();
        passwordController.clear();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return SignIn();
        }));
      }

      return true;
    } on SocketException {
      load = false;
      message = 'no internet connection';
      notifyListeners();
      return false;
    } catch (e) {
      load = false;
      message = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> loginUser(context) async {
    UserService _userService = UserService();
    try {
      load = true;
      notifyListeners();
      final resMessage = await _userService.loginUser(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
      );
      load = false;
      notifyListeners();
      print(resMessage);
      if (resMessage['body']['message'] == 'user logged in successfully') {
        emailController.clear();
        passwordController.clear();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return DesktopViewHomePage();
        }));
      }
      return true;
    } on SocketException {
      message = 'no internet connection';
      load = false;
      notifyListeners();
      return false;
    } catch (e) {
      message = e.toString();
      load = false;
      notifyListeners();

      return false;
    }
  }
}
