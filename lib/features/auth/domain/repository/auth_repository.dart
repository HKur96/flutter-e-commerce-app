import 'package:ecommerce_app/features/auth/domain/dto/signin_dto.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signup_dto.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';

abstract class AuthRepository {
  Future<User?> signIn(SigninDto signInDto);

  Future<User?> signUp(SignupDto signUpDto);
}
