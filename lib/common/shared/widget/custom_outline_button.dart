import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;

  const CustomOutlineButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: context.palette.blueOcean,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        child: Text(
          name,
          style: context.text.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: context.palette.blueOcean,
          ),
        ),
      ),
    );
  }
}
