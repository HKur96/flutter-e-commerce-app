import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController controller;
  final bool isObsecure;
  final Function(String)? onChanged;
  final String? errorText;

  CustomTextFormField({
    super.key,
    required this.controller,
    this.title,
    this.validator,
    this.hintText,
    this.isObsecure = false,
    this.onChanged,
    this.errorText,
  });

  late final obscureNotifier = ValueNotifier<bool>(isObsecure);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: context.text.bodyLarge?.copyWith(
              color: context.palette.navyBlack,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 7),
        ],
        ValueListenableBuilder<bool>(
          valueListenable: obscureNotifier,
          builder: (context, isObscure, _) {
            return TextFormField(
              obscureText: isObscure,
              controller: controller,
              style: context.text.bodyLarge?.copyWith(
                color: context.palette.navyBlack,
                fontWeight: FontWeight.w500,
              ),
              validator: validator,
              decoration: InputDecoration(
                errorText: errorText,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: context.palette.softGrey,
                hintText: hintText,
                hintStyle: context.text.bodyLarge?.copyWith(
                  color: context.palette.halfGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: context.palette.navyBlack, width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: context.palette.redVelvet, width: 0.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: context.palette.redVelvet, width: 0.5),
                ),
                suffixIcon: (isObsecure)
                    ? IconButton(
                        onPressed: () =>
                            obscureNotifier.value = !obscureNotifier.value,
                        icon: Icon(
                          (isObscure) ? Icons.visibility_off : Icons.visibility,
                          size: 20,
                          color: context.palette.halfGrey,
                        ),
                      )
                    : null,
              ),
              onChanged: onChanged,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
            );
          },
        ),
      ],
    );
  }
}
