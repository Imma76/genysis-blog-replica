import 'package:genesys_blog/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPref {
  static Future storeUser(
      {required String email,
      required String firstName,
      required String lastName,
      required String image,   required String userId,
      
      required String token}) async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setString('email', email);
    await _sharedPref.setString('firstName', firstName);
    await _sharedPref.setString('lastName', lastName);
    await _sharedPref.setString('token', token);
     await _sharedPref.setString('image', image);
       await _sharedPref.setString('userId', userId);
     
    
  }

  static Future<UserModel> getUser() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();

    String? email = _sharedPref.getString('email');
    String? token = _sharedPref.getString(
      'token',
    );
     String? image = _sharedPref.getString(
      'image',
    );
    String? lastName = _sharedPref.getString(
      'lastName',
    );
    String? firstName = _sharedPref.getString(
      'firstName',
    );
     String? userId = _sharedPref.getString(
      'userId',
    );
    return UserModel(
        email: email, token: token, firstName: firstName, lastName: lastName, photo:image, userId:userId );
  }

  static clear() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.clear();
  }
}
