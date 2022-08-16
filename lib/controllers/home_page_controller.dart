import 'package:flutter/material.dart';
import 'package:genesys_blog/models/post_model.dart';
import 'package:genesys_blog/services/post.dart';
import 'package:genesys_blog/views/desktop_view/home_page.dart';
import 'package:genesys_blog/views/desktop_view/user_drafts.dart';
import 'package:genesys_blog/views/desktop_view/user_post.dart';
import 'package:genesys_blog/views/desktop_view/users_dashboard.dart';

class HomePageController extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool load = false;
  List<PostsModel?>? newsList;
  List<Widget> widgetList = [
    const HomePage(),
    const UserPost(),
    const UserDrafts(),
    const UserDashBoardDesktopView(),
  ];

  PostsModel? news;

  changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future loadNews({String category = 'news'}) async {
    load = true;
    PostService post = PostService();
    try {
      newsList = await post.getPosts(category);
      load = false;
      notifyListeners();
      print(newsList![0]!.articleId);
      return newsList;
    } catch (e) {
      load = false;
    }
    notifyListeners();
  }
}
