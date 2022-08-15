import 'package:flutter/material.dart';
import 'package:genesys_blog/models/drafts_model.dart';
import 'package:genesys_blog/services/drafts_service.dart';

class DraftsController extends ChangeNotifier {
  List<DraftsModel?>? draftsList;
  bool load = false;
  Future getDrafts() async {
    DraftsService _draftService = DraftsService();

    try {
      load = true;
      draftsList = await _draftService.getUserDrafts();
      load = false;
      notifyListeners();
    } catch (e) {
       load = false;
      notifyListeners();
    }
  }
}
