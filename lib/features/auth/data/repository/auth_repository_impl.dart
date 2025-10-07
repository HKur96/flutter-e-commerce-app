import 'package:ecommerce_app/common/helper/api_helper.dart';
import 'package:ecommerce_app/features/auth/data/model/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signin_dto.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signup_dto.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiHelper _apiHelper;

  const AuthRepositoryImpl(this._apiHelper);

  @override
  Future<User?> signIn(SigninDto signInDto) async {
    try {
      final res = await _apiHelper.dio.post(
        '/auth/signin',
        data: signInDto.toJson(),
      );

      return UserModel.fromJson(res.data['data']);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> signUp(SignupDto signUpDto) async {
    try {
      final res = await _apiHelper.dio.post(
        '/auth/signup',
        data: signUpDto.toJson(),
      );

      return UserModel.fromJson(res.data['data']);
    } catch (e) {
      return null;
    }
  }
}
