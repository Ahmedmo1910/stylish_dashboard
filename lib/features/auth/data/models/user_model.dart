import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylish_dashboard/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uId, required super.email});

  factory UserModel.fromFireBaseUser(User user) {
    return UserModel(
      uId: user.uid,
      email: user.email ?? 'No Email',
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      email: json['email'],
    );
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      uId: user.uId,
      email: user.email,
    );
  }
  toMap() {
    return {
      'uId': uId,
      'email': email,
    };
  }
}
