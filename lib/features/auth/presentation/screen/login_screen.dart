import 'package:ecommerce_app/common/config/constant.dart';
import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/common/shared/widget/custom_button.dart';
import 'package:ecommerce_app/common/shared/widget/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signin_dto.dart';
import 'package:ecommerce_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthProvider _authProvider = context.read<AuthProvider>();

  final TextEditingController _emailOrPhoneC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailOrPhoneC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Navigator.of(context).canPop())
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 30,
                      color: context.palette.navyBlack,
                    ),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 55),
                        Text(
                          'Welcome back to \nTumbas',
                          style: context.text.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: context.palette.navyBlack,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Silahkan masukan data untuk login',
                          style: context.text.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: context.palette.darkGrey,
                          ),
                        ),
                        const SizedBox(height: 50),
                        CustomTextFormField(
                          title: 'Email/ Phone',
                          controller: _emailOrPhoneC,
                          hintText: 'Masukan Alamat Email/ No Telepon Anda',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email/ Phone tidak boleh kosong';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          title: 'Password',
                          controller: _passwordC,
                          hintText: 'Masukan Kata Sandi Akun',
                          isObsecure: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 50),
                        Selector<AuthProvider, bool>(
                          selector: (_, authProvider) =>
                              authProvider.isLoadingSignIn,
                          builder: (context, isLoadingSignIn, _) {
                            return CustomButton(
                              name: 'Sign In',
                              isLoading: isLoadingSignIn,
                              onPressed: (isLoadingSignIn)
                                  ? null
                                  : () async {
                                      await _authProvider
                                          .signIn(SigninDto(
                                        email: _emailOrPhoneC.text,
                                        password: _passwordC.text,
                                        role: Role.user,
                                      ))
                                          .then((user) {
                                        if (user == null || !context.mounted) {
                                          return;
                                        }

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                          (route) => false,
                                        );
                                      });
                                    },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  Constant.kRouteResetPassword,
                ),
                child: Text(
                  'Forgot Password?',
                  style: context.text.bodyLarge?.copyWith(
                    color: context.palette.navyBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Constant.kRouteRegister);
                },
                child: Text(
                  'Sign Up',
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
      ),
    );
  }
}
