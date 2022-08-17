import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/models/drafts_model.dart';
import 'package:genesys_blog/models/user_model.dart';
import 'package:genesys_blog/utils/user_details.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DraftsService {
  Future<List<DraftsModel?>?> getUserDrafts() async {
    UserModel _userModel = await UserSharedPref.getUser();
    print('heyyyyy${_userModel.token}');
    List<DraftsModel> draftsList = [];
    try {
      var response = await http.get(Uri.parse(baseUrl + 'drafts'),
          headers: {'Authorization': 'Bearer ${_userModel.token}'});
      var decode = jsonDecode(response.body);


      if (decode['message'] == 'this user has no drafts') {
        return draftsList;
      }
      for (int drafts = 0; drafts < decode['body'].length; drafts++) {
        DraftsModel _comment = DraftsModel.fromJson(
          decode['body'][drafts],
        );

        draftsList.add(_comment);
      }
      return draftsList;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
