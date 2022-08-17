import 'package:genesys_blog/models/post_model.dart';

class UserDetails {
  int? postLength;
  int? postReactions;
  List<PostsModel?>? postList;
  UserDetails({this.postLength, this.postList, this.postReactions});

  UserDetails.fromJson(Map data, postLists) {
    // print(data);
    postLength = data['postLength'];
    postReactions = data['reactions'];
    postList = postLists;
  }
}
