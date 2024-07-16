import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class BigButton extends StatefulWidget {
  final void Function() onTap;
  final String title;

  const BigButton({
    super.key,
    required this.title,
    required this.onTap,
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
          buttonColor = ColorStyles.primary80;
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
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: buttonColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text Style/Normal Text/Bold
              Text(
                widget.title,
                style: Fonts.normalTextBold.copyWith(
                  color: ColorStyles.white,
                ),
              ),
              const SizedBox(width: 30),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}