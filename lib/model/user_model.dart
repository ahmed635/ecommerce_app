class UserModel {
  String? id;
  String? username;
  String? email;
  String? phone;
  String? image;
  String? address;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.phone,
      this.image,
      this.address});

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "phone": phone,
    "image": image,
    "address": address,
  };
}