import 'package:flutter/cupertino.dart';
import 'package:genesys_blog/models/news_model.dart';
import 'package:genesys_blog/services/post.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool load = false;
  List<NewsModel?>? newsList;

  changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future loadNews({String category = 'news'}) async {
    load = true;
    Post post = Post();
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
