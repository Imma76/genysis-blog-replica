import 'package:flutter/material.dart';
import 'package:genesys_blog/models/comment_model.dart';
import 'package:genesys_blog/services/comments_service.dart';

class CommentController extends ChangeNotifier {
  List<CommentModel?>? commentList;
  bool load = false;
  Future getCommentBbyArticleId(String articleId) async {
    try {
      load = true;
      CommentService commentService = CommentService();

      commentList = await commentService.getArticleComments(articleId);
      load = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
       load = false;
      notifyListeners();
    }
  }
}
