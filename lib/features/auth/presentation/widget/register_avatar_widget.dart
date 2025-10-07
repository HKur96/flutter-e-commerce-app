import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/common/shared/widget/custom_button.dart';
import 'package:ecommerce_app/common/shared/widget/custom_outline_button.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signup_dto.dart';
import 'package:ecommerce_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:ecommerce_app/features/home/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAvatarWidget extends StatelessWidget {
  final ValueNotifier<SignupDto> signUpData;

  const RegisterAvatarWidget({super.key, required this.signUpData});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Text(
          'Pilih avatar',
          style: context.text.bodyMedium?.copyWith(
            color: context.disableColor,
          ),
        ),
        const SizedBox(height: 80),
        CircleAvatar(
          radius: 50,
          child: Icon(Icons.camera_alt_outlined),
        ),
        const SizedBox(height: 80),
        Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomOutlineButton(
                  name: 'Skip',
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                CustomButton(
                  name: 'Register',
                  onPressed: () async {
                    await authProvider.signUp(signUpData.value).then((user) {
                      if (user != null && context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    });
                  },
                  isLoading: authProvider.isLoadingSignUp,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
