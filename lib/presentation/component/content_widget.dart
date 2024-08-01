import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class ContentWidget extends StatelessWidget {
  final String content;

  const ContentWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: ColorStyles.primary100,
            width: 1.0,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              content,
              style: Fonts.smallTextRegular.copyWith(
                color: ColorStyles.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
