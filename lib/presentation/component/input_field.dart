import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final void Function(String text) onChanged;
  final String label;
  final String placeHolder;
  final double topPadding;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final int? maxLength;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.onChanged,
    required this.topPadding,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.obscureText = false,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Fonts.smallTextRegular,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            style: Fonts.smallerTextRegular.copyWith(
              color: ColorStyles.black,
            ),
            keyboardType: keyboardType,
            onChanged: onChanged,
            inputFormatters: [
              ...inputFormatters,
              if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
            ],
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: Fonts.smallerTextRegular.copyWith(
                color: ColorStyles.grey4,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorStyles.primary80,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorStyles.grey4,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
