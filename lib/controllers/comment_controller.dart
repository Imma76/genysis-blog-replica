import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:genesys_blog/models/comment_model.dart';
import 'package:genesys_blog/services/comments_service.dart';

class CommentController extends ChangeNotifier {
  List<CommentModel?>? commentList;
  TextEditingController emailController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  bool validate() {
    if (emailController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        commentController.text.isEmpty) {
      BotToast.showText(text: "xxxx");
      return false;
    }
    return true;
  }

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
