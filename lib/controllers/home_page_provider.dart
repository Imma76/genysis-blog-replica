import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
