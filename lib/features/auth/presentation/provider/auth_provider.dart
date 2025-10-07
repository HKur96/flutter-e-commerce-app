import 'package:ecommerce_app/common/helper/secure_storage.dart';
import 'package:ecommerce_app/common/shared/provider/disposable_provider.dart';
import 'package:ecommerce_app/common/utils/injector.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signin_dto.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signup_dto.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';
import 'package:ecommerce_app/features/auth/domain/use-case/auth_usecase.dart';

class AuthProvider extends DisposableProvider {
  bool _isLoadingSignIn = false;
  bool _isLoadingSignUp = false;

  User? _user;

  User? get user => _user;

  bool get isLoadingSignIn => _isLoadingSignIn;
  bool get isLoadingSignUp => _isLoadingSignUp;

  Future<User?> signIn(SigninDto signInDto) async {
    try {
      _isLoadingSignIn = true;
      notifyListeners();

      _user = await locator<SignInUseCase>().call(signInDto);

      if (_user == null) {
        throw 'Cannot login';
      }

      await SecureStorage().setUserModel(_user!);

      _isLoadingSignIn = false;
      notifyListeners();

      return _user;
    } catch (e) {
      _isLoadingSignIn = false;
      notifyListeners();
      return null;
    }
  }

  Future<User?> signUp(SignupDto signUpDto) async {
    try {
      _isLoadingSignUp = true;
      notifyListeners();

      _user = await locator<SignUpUseCase>().call(signUpDto);

      if (_user == null) {
        throw 'Cannot sign up';
      }

      await SecureStorage().setUserModel(_user!);

      _isLoadingSignUp = false;
      notifyListeners();

      return _user;
    } catch (e) {
      _isLoadingSignUp = false;
      notifyListeners();
      return null;
    }
  }

  @override
  void disposeValues() {
    _user = null;
    notifyListeners();
  }
}
