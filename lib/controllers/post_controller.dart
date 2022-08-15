import 'package:flutter/cupertino.dart';
import 'package:genesys_blog/services/post.dart';

import '../models/post_model.dart';

class PostController extends ChangeNotifier {
  List<PostsModel?>? posts;
    bool load = false;
      PostsModel? news;
  List<PostsModel?>? newsList;
    Future loadNewsById(String id) async {
    load = true;
    PostService post = PostService();
    try {
      news = await post.getPostsById(id);
      load = false;
      notifyListeners();

      return newsList;
    } catch (e) {
      load = false;
    }
    notifyListeners();
  }
  Future getUserPosts() async {
    try {
      PostService postService = PostService();
      posts = await postService.getUserPosts();
    } catch (e) {}
  }
}
