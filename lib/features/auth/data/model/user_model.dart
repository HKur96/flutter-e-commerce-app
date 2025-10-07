import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.avatarUrl,
    required super.role,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        avatarUrl: json['avatar_url'],
        role: (json['role'] == null || json['role'] == 'USER')
            ? Role.user
            : (json['role'] == 'SELLER')
                ? Role.seller
                : Role.admin,
        token: json['token'] ?? '',
      );
}
