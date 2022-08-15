class CommentModel {
  String? comment;
  String? email;
  String? name;
  String? articleId;
  String? editorsId;
  CommentModel(
      {this.articleId, this.comment, this.editorsId, this.email, this.name});

  CommentModel.fromJson(Map data) {
    comment = data['comment'];
    email = data['email'];
    name = data['name'];
    articleId = data['articleId'];
    editorsId = data['editorsId'];
  }
}
