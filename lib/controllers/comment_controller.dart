import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:genesys_blog/models/comment_model.dart';
import 'package:genesys_blog/services/comments_service.dart';

class CommentController extends ChangeNotifier {
  List<CommentModel?>? commentList;
  bool load = false;
  CommentService commentService = CommentService();
  TextEditingController emailController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController userCommentController = TextEditingController();

  bool validate() {
    if (emailController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        userCommentController.text.isEmpty) {
      BotToast.showText(text: "Please Complete all fields");
      return false;
    }
    return true;
  }

  Future postComment({String? articleId, String? editorsId}) async {
    try {
      load = true;
      notifyListeners();
      String? message = await commentService.postComments(
          email: emailController.text.trim(),
          comments: userCommentController.text.trim(),
          name: firstNameController.text.trim(),
          articleId: articleId,
          editorsId: editorsId);
      if (message == 'comment posted successfully') {
        firstNameController.clear();
        emailController.clear();
        userCommentController.clear();
          BotToast.showText(text: message.toString());
      }

      BotToast.showText(text: message.toString());
      load = false;
      notifyListeners();
    } catch (e) {
      BotToast.showText(text: e.toString());
      load = false;
      notifyListeners();
    }
  }

  Future getCommentBbyArticleId(String articleId) async {
    try {
      load = true;

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
