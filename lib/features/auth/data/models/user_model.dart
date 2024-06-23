import 'package:blog_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? " ",
      email: json['email'] ?? " ",
      name: json['name'] ?? " ",
    );
  }
}
