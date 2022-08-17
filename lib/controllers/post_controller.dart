import 'package:flutter/material.dart';
import 'package:genesys_blog/models/user_details_model.dart';
import 'package:genesys_blog/services/post.dart';

import '../models/post_model.dart';

class PostController extends ChangeNotifier {
  List<PostsModel?>? userPosts;
  UserDetails? userDetails;
  bool load = false;
  PostsModel? news;
  PostService postService = PostService();

  Future loadNewsById(String id) async {
    load = true;

    try {
      news = await postService.getPostsById(id);
      load = false;
      notifyListeners();

      // return newsList;
    } catch (e) {
      load = false;
      print(e.toString());
    }
    notifyListeners();
  }

  Future getUserPosts() async {
    try {
      load = true;

      userPosts = await postService.getUserPosts();
      load = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      load = false;
      notifyListeners();
    }
  }

  Future getUserDetails() async {
    try {
      load = true;

      userDetails = await postService.getUserDetails();
      load = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      load = false;
      notifyListeners();
    }
  }
}
