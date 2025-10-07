import 'package:ecommerce_app/common/config/enum.dart';

class SignupDto {
  final String? name;
  final String? email;
  final String? password;
  final String? avatarUrl;
  final Role? role;

  const SignupDto({
    this.name,
    this.email,
    this.password,
    this.avatarUrl,
    this.role,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'avatar_url': avatarUrl,
        'role': role?.name.toUpperCase(),
      };

  SignupDto copyWith({
    String? name,
    String? email,
    String? password,
    String? avatarUrl,
    Role? role,
  }) =>
      SignupDto(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        role: role ?? this.role,
      );
}
