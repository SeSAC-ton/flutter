import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class BigButton extends StatefulWidget {
  final void Function() onTap;
  final String title;
  final Widget? leading;

  const BigButton({
    super.key,
    required this.title,
    required this.onTap,
    this.leading,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  Color buttonColor = ColorStyles.primary100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          buttonColor = ColorStyles.primary60;
        });
      },
      onTapUp: (_) {
        setState(() {
          buttonColor = ColorStyles.primary100;
          widget.onTap();
        });
      },
      onTapCancel: () {
        buttonColor = ColorStyles.primary100;
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: buttonColor,
        ),
        child: Stack(
          children: [
            if (widget.leading != null)
              Positioned(
                left: 20,
                top: 0,
                bottom: 0,
                child: widget.leading!,
              ),
            Center(
              child: Text(
                widget.title,
                style: Fonts.normalTextBold.copyWith(
                  color: ColorStyles.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
