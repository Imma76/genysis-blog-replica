class Posts {
  String? title;
  String? body;
  String? image;
  String? postId;
  String? postViews;
  DateTime? createdAt;
  DateTime? updatedAt;
  Posts(
      {this.body,
      this.createdAt,
      this.image,
      this.postId,
      this.postViews,
      this.title,
      this.updatedAt});
  Posts.fromJson(Map data) {
    title = data['title'];
    body = data['body'];
    image = data['image'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
    postId = data['_id'];
    postViews = data['views'];
  }
}
