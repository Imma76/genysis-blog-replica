import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/models/comment_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentService {
  Future<List<CommentModel?>?> getArticleComments(String articleId) async {
    List<CommentModel?> commentList = [];
    try {
      var response = await http.get(
        Uri.parse(baseUrl + 'post/comments/$articleId'),
      );
      var decode = jsonDecode(response.body);
      if (decode['message'] == 'no comments available') {
        return commentList;
      }
      for (int comment = 0; comment < decode['body'].length; comment++) {
        CommentModel _comment = CommentModel.fromJson(
          decode['body'][comment],
        );

        commentList.add(_comment);
      }
      return commentList;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String?> postComments(
      {String? email,
      String? name,
      String? articleId,
      String? editorsId,
      String? comments}) async {
    List<CommentModel?> commentList = [];
    try {
      Map body = {
        'articleId': articleId,
        'email': email,
        'editorsId': editorsId,
        'comment': comments,
        'name': name,
      };
      var response = await http.post(
        Uri.parse(
          baseUrl + 'post/comments', 
        ),body:body
      );
      var decode = jsonDecode(response.body);
     // if (decode['message'] == 'comment posted successfully') {
        return decode['message'];
     // }
    
     
    } catch (e) {
      print(e.toString());
    }
  }
}
