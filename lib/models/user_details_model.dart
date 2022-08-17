import 'package:genesys_blog/models/post_model.dart';

class UserDetails {
  String? postLength;
  String? postReactions;
  List<PostsModel>? postList;
  UserDetails({this.postLength, this.postList, this.postReactions});

  UserDetails.fromJson(Map data) {
    postLength = data['postLength'];
    postReactions = data['reactions'];
    for (int i = 0; i < data['userPost'].length; i++) {
      PostsModel _postList = PostsModel.fromJson(data['userPost'][i]);
      postList!.add(_postList);
    }
  }
}
