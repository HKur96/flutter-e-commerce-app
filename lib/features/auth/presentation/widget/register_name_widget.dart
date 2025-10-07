import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/common/shared/widget/custom_button.dart';
import 'package:ecommerce_app/common/shared/widget/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/domain/dto/signup_dto.dart';
import 'package:flutter/material.dart';

class RegisterNameWidget extends StatelessWidget {
  final TextEditingController nameC;
  final TextEditingController emailC;
  final VoidCallback onContinue;
  final ValueNotifier<SignupDto> signUpData;

  RegisterNameWidget({
    super.key,
    required this.nameC,
    required this.emailC,
    required this.onContinue,
    required this.signUpData,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            'Masukkan data diri',
            style: context.text.bodyMedium?.copyWith(
              color: context.disableColor,
            ),
          ),
          const SizedBox(height: 80),
          CustomTextFormField(
            title: 'Nama Lengkap',
            hintText: 'Masukan nama lengkap Anda',
            controller: nameC,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama lengkap tidak boleh kosong';
              }

              return null;
            },
            onChanged: (val) =>
                signUpData.value = signUpData.value.copyWith(name: val),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            title: 'Email',
            hintText: 'Masukan email Anda',
            controller: emailC,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email tidak boleh kosong';
              }

              return null;
            },
            onChanged: (val) =>
                signUpData.value = signUpData.value.copyWith(email: val),
          ),
          const SizedBox(height: 75),
          CustomButton(
            name: 'Continue',
            isLoading: false,
            onPressed: () {
              if (_formKey.currentState?.validate() != true) return;

              // set user role as user
              signUpData.value = signUpData.value.copyWith(role: Role.user);
              
              onContinue();
            },
          ),
        ],
      ),
    );
  }
}
