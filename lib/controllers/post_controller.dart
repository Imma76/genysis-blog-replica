import 'package:flutter/cupertino.dart';
import 'package:genesys_blog/services/post.dart';

import '../models/post_model.dart';

class PostController extends ChangeNotifier {
  List<PostsModel?>? userPosts;
  bool load = false;
  PostsModel? news;

  Future loadNewsById(String id) async {
    load = true;
    PostService post = PostService();
    try {
      news = await post.getPostsById(id);
      load = false;
      notifyListeners();

      // return newsList;
    } catch (e) {
      load = false;
    }
    notifyListeners();
  }

  Future getUserPosts() async {
    try {
      load = true;
      PostService postService = PostService();
      userPosts = await postService.getUserPosts();
      load = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      load = false;
      notifyListeners();
    }
  }
}
