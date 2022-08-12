class NewsModel {
  String? title;
  String? image;
  String? body;
  String? newsDate;
  int? views;
 
  NewsModel(
      {this.body,
     // this.comments,
      this.image,
      this.newsDate,
      this.title,
      this.views});
  NewsModel.fromJson(Map data) {
    title = data['title'];
    body = data['body'];
    image = data['image'];
    views = data['views'];
 //   comments = data['comments'];
  }
}
