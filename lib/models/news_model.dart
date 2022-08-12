class NewsModel {
  String? title;
  String? image;
  String? body;
  String? newsDate;
  int? views;
  String? category;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? articleId;

  NewsModel(
      {this.body,
      // this.comments,
      this.category,
      this.image,
      this.newsDate,
      this.articleId,
      this.userId,
      this.title,
      this.views});
  NewsModel.fromJson(Map data) {
   
    title = data['title'];
    body = data['body'];
    image = data['image'];
    views = data['views'];
    articleId = data['_id'];
    category = data['category'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
    userId = data['userId'];
    //   comments = data['comments'];
  }
}
