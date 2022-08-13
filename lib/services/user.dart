import 'dart:convert';

import 'package:genesys_blog/constant.dart';
import 'package:http/http.dart' as http;

class User {
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
      var response = await http.post(Uri.parse(baseUrl + 'user'),body: body);
      var decode = jsonDecode(response.body);
      return decode['message'];
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
