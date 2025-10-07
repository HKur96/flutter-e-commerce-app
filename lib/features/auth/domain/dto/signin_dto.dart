import 'package:ecommerce_app/common/config/enum.dart';

class SigninDto {
  final String email;
  final String password;
  final Role role;

  const SigninDto({
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'role': role.name.toUpperCase(),
  };
}
