import 'package:ecommerce_app/common/shared/base_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signin_dto.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signup_dto.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase implements BaseUseCase<User?, SigninDto> {
  final AuthRepository _authRepository;

  const SignInUseCase(this._authRepository);

  @override
  Future<User?> call(SigninDto signInDto) {
    return _authRepository.signIn(signInDto);
  }
}

class SignUpUseCase implements BaseUseCase<User?, SignupDto> {
  final AuthRepository _authRepository;

  const SignUpUseCase(this._authRepository);

  @override
  Future<User?> call(SignupDto params) {
    return _authRepository.signUp(params);
  }
}
