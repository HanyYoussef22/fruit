import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.uid, required super.name, required super.email});

  toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ,
      name: json['name'],
      email: json['email'] );
  }
}


