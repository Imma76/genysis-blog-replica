class DraftsModel {
  String? title;
  String? body;
  String? image;
  DateTime? createdAt;
  String? draftsId;
  String? userId;

  DraftsModel(
      {this.body,
      this.createdAt,
      this.draftsId,
      this.image,
      this.title,
      this.userId});

  DraftsModel.fromJson(Map data) {
    body = data['body'];
    title = data['title'];
    image = data['image'];
    createdAt = data['createdAt'];
    userId = data['userId'];
    draftsId = data['_id'];
  }
}
