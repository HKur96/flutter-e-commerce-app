import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.name,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return context.palette.halfGrey;
              }
              return context.palette.blueOcean;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.white;
              }
              return Colors.white;
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: (isLoading)
            ? SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(
                name,
                style: context.text.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
