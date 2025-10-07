import 'package:ecommerce_app/common/config/constant.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signup_dto.dart';
import 'package:ecommerce_app/features/auth/presentation/provider/validation_provider.dart';
import 'package:ecommerce_app/features/auth/presentation/widget/register_avatar_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/widget/register_name_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/widget/register_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  final TextEditingController _confirmPasswordC = TextEditingController();

  late final PageController _pageController = PageController(initialPage: 0);

  final ValueNotifier<SignupDto> _signUpData =
      ValueNotifier<SignupDto>(SignupDto());
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  void _updateCurrentPage() {
    if (_pageController.hasClients && _pageController.page != null) {
      _currentPageNotifier.value = _pageController.page!.round();
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updateCurrentPage);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ValidationProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Navigator.of(context).canPop())
                GestureDetector(
                  onTap: _onTapBack,
                  child: Icon(
                    Icons.chevron_left_rounded,
                    size: 30,
                    color: context.palette.navyBlack,
                  ),
                ),
              SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Register Account',
                  style: context.text.bodyLarge?.copyWith(
                    color: context.palette.navyBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    RegisterNameWidget(
                      nameC: _nameC,
                      emailC: _emailC,
                      onContinue: () {
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      signUpData: _signUpData,
                    ),
                    RegisterPasswordWidget(
                      passwordC: _passwordC,
                      confirmPasswordC: _confirmPasswordC,
                      onContinue: () {
                        _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      signUpData: _signUpData,
                    ),
                    RegisterAvatarWidget(signUpData: _signUpData),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
            valueListenable: _currentPageNotifier,
            builder: (context, currentPage, _) {
              if (currentPage != 0) {
                return const SizedBox.shrink();
              }

              return SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an Account?',
                        style: context.text.bodyLarge?.copyWith(
                          color: context.palette.darkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(Constant.kRouteLogin);
                        },
                        child: Text(
                          'Sign In',
                          style: context.text.bodyLarge?.copyWith(
                            color: context.palette.blueOcean,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentPage);
    _nameC.dispose();
    _emailC.dispose();
    _passwordC.dispose();
    _confirmPasswordC.dispose();
    _pageController.dispose();

    super.dispose();
  }

  void _onTapBack() {
    switch (_pageController.page) {
      case 2:
        _pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        break;
      case 1:
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        break;
      default:
        Navigator.of(context).pop();
    }
  }
}
