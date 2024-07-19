import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class WarningText extends StatelessWidget {
  final String text;

  const WarningText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '* $text',
      style: Fonts.smallerTextBold.copyWith(
        color: ColorStyles.warningRed,
      ),
    );
  }
}
