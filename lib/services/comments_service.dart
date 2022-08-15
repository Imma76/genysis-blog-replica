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
}
