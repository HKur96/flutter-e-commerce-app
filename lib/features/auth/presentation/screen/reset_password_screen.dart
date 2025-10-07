import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/common/shared/widget/custom_button.dart';
import 'package:ecommerce_app/common/shared/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 30,
                  color: context.palette.navyBlack,
                ),
              ),
              Text(
                'Reset Password',
                style: context.text.bodyLarge?.copyWith(
                  color: context.palette.navyBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Masukan Email/ No. Hp akun untuk mereset kata\nsandi Anda ',
                style: context.text.bodyLarge?.copyWith(
                  color: context.palette.darkGrey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 75),
              CustomTextFormField(
                title: 'Email/ No Telepon',
                controller: _controller,
                hintText: 'Masukan Alamat Email/ No Telepon Anda',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
                onChanged: (String) {},
              ),
              SizedBox(height: 60),
              CustomButton(
                name: 'Reset ',
                isLoading: false,
                onPressed: () {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
