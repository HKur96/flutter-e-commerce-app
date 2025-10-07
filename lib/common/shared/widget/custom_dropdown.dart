import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/config/extensions.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? Function(T?)? validator;
  final T? value;
  final List<T> options;
  final String Function(T item) itemLabelBuilder;
  final ValueChanged<T?>? onChanged;
  final bool enabled;
  final double menuMaxHeight;

  const CustomDropdown({
    super.key,
    required this.options,
    required this.itemLabelBuilder,
    this.value,
    this.onChanged,
    this.title,
    this.hintText,
    this.validator,
    this.enabled = true,
    this.menuMaxHeight = 280,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);

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
          const SizedBox(height: 10),
        ],
        DropdownButtonFormField<T>(
          value: value,
          onChanged: enabled ? onChanged : null,
          validator: validator,
          isExpanded: true,
          menuMaxHeight: menuMaxHeight,
          borderRadius: borderRadius,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.palette.navyBlack,
          ),
          dropdownColor: context.palette.pureWhite,
          style: context.text.bodyLarge?.copyWith(
            color: context.palette.navyBlack,
            fontWeight: FontWeight.w500,
          ),
          items: options
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  child: Text(
                    itemLabelBuilder(e),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            filled: true,
            fillColor: context.palette.softGrey,
            hintText: hintText,
            hintStyle: context.text.bodyLarge?.copyWith(
              color: context.palette.halfGrey,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: context.palette.halfGrey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: context.palette.navyBlack, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: context.palette.redVelvet, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide:
                  BorderSide(color: context.palette.redVelvet, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
