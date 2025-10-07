import 'package:ecommerce_app/common/config/enum.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? avatarUrl;
  final Role role;
  final String token;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.role,
    required this.token,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'avatar_url': avatarUrl,
        'role': role.name.toUpperCase(),
        'token': token,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        avatarUrl,
        role,
        token,
      ];
}
