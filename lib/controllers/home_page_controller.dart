import 'package:flutter/cupertino.dart';
import 'package:genesys_blog/models/news_model.dart';
import 'package:genesys_blog/services/post.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool load = false;
  List<NewsModel?>? model;

  changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future loadNews() async {
    load = true;
    Post post = Post();
    try {
      model = await post.getPosts('news');
      load = false;
        notifyListeners();
      print(model![0]!.articleId);
      return model;
    } catch (e) {
       load = false;
    }
    notifyListeners();
  }
}
