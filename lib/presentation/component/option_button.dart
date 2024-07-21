import 'package:flutter/material.dart';

import '../../data/model/worksheet/option.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class OptionButton extends StatefulWidget {
  final void Function() onTap;
  final Option option;

  const OptionButton({
    super.key,
    required this.onTap,
    required this.option,
  });

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  Color buttonColor = ColorStyles.primary100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
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
          height: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: buttonColor,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.option.name,
                  style: Fonts.normalTextSemiBold.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
