import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/common/shared/widget/custom_button.dart';
import 'package:ecommerce_app/common/shared/widget/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signup_dto.dart';
import 'package:ecommerce_app/features/auth/presentation/provider/validation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPasswordWidget extends StatelessWidget {
  final TextEditingController passwordC;
  final TextEditingController confirmPasswordC;
  final VoidCallback onContinue;
  final ValueNotifier<SignupDto> signUpData;

  const RegisterPasswordWidget({
    super.key,
    required this.passwordC,
    required this.confirmPasswordC,
    required this.onContinue,
    required this.signUpData,
  });

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ValidationProvider>(
      builder: (context, validation, _) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Text(
              'Masukkan password',
              style: context.text.bodyMedium?.copyWith(
                color: context.disableColor,
              ),
            ),
            const SizedBox(height: 80),
            CustomTextFormField(
              title: 'Password',
              hintText: 'Masukan password',
              controller: passwordC,
              errorText: validation.passwordError,
              isObsecure: true,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Password tidak boleh kosong';
              //   }

              //   if (value.length < 8) {
              //     return 'Minimal 8 karakter';
              //   }

              //   return null;
              // },
              onChanged: (value) {
                validation.validatePassword(value);
                // Clear submission state when user types
                if (value.isNotEmpty) {
                  validation.clearValidation();
                }

                signUpData.value = signUpData.value.copyWith(password: value);
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              title: 'Konfirmasi Password',
              hintText: 'Konfirmasi password Anda',
              controller: confirmPasswordC,
              isObsecure: true,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Konfirmasi password tidak boleh kosong';
              //   }

              //   if (passwordC.text != value) {
              //     return 'Konfirmasi password tidak sesuai';
              //   }

              //   return null;
              // },
              onChanged: (value) {},
            ),
            const SizedBox(height: 75),
            CustomButton(
              name: 'Continue',
              isLoading: false,
              onPressed: () {
                // if (_formKey.currentState?.validate() != true) return;
                validation.submit();

                if (!validation.isValid) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('There is something missing')),
                  );
                  return;
                }

                onContinue();
              },
            ),
          ],
        );
      },
    );
  }
}
