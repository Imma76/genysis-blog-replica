class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  String? userId;
  String? photo;

  UserModel(
      {this.email, this.firstName, this.lastName, this.token, this.userId});

  UserModel.fromJson(Map data) {
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    photo = data['photo'];
    userId = data['_id'];
  }
}
