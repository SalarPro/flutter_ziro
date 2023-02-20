class UserModel {
  String? name;
  String? userName;
  String? phone;
  String? imageURL;

  UserModel({
    this.name,
    this.userName,
    this.phone,
    this.imageURL,
  });

  static fromMap(jsonModel) {
    var map = jsonModel as Map<String, dynamic>;
    return UserModel(
      name: map['login'],
      userName: map['node_id'],
      phone: map['id'].toString(),
      imageURL: map['avatar_url'],
    );
  }
}
