import 'package:genesys_blog/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPref {
  Future storeUser(
      {required String email,
      required String firstName,
      required String lastName,
      required String token}) async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setString('email', email);
    await _sharedPref.setString('firstName', firstName);
    await _sharedPref.setString('lastName', lastName);
    await _sharedPref.setString('token', token);
  }

  Future<UserModel> getUser() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();

    String? email = _sharedPref.getString('email');
    String? token = _sharedPref.getString(
      'token',
    );
    String? lastName = _sharedPref.getString(
      'lastName',
    );
    String? firstName = _sharedPref.getString(
      'token',
    );
    return UserModel(email: email, token: token, firstName: firstName, lastName: lastName);
  }
}
