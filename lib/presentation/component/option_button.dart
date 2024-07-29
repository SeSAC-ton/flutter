import 'package:flutter/material.dart';

import '../../data/model/worksheet/option.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class OptionButton extends StatefulWidget {
  final void Function() onTap;
  final Option option;
  final bool isSolved;

  const OptionButton({
    super.key,
    required this.onTap,
    required this.option,
    required this.isSolved,
  });

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  Color buttonColor = ColorStyles.grey2;

  @override
  Widget build(BuildContext context) {
    if (widget.isSolved) {
      buttonColor = widget.option.isAnswer
          ? ColorStyles.primary60
          : ColorStyles.warningRed;
    }
    final Widget icon =
    (widget.isSolved && widget.option.isAnswer)
        ? const Icon(Icons.check)
        : const Icon(Icons.close);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            buttonColor = ColorStyles.primary60;
          });
        },
        onTapUp: (_) {
          setState(() {
            buttonColor = ColorStyles.primary80;
            widget.onTap();
          });
        },
        onTapCancel: () {
          buttonColor = ColorStyles.primary80;
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: (widget.isSolved && widget.option.isAnswer)
                ? buttonColor
                : ColorStyles.white,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(
              width: 1,
              color: buttonColor,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                widget.option.name,
                style: Fonts.normalTextSemiBold.copyWith(
                  color: ColorStyles.black,
                ),
              ),
              if (widget.isSolved)
                Positioned(
                  right: 10,
                  child: icon, // 아이콘을 오른쪽 끝에 배치
                ),
            ],
          ),
        ),
      ),
    );
  }
}
