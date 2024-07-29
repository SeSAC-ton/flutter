import 'package:flutter/material.dart';

import '../../../ui/text_styles.dart';

class CategoryButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String label;
  final void Function() onPressed;

  const CategoryButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(icon),
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: Fonts.smallTextBold,
            ),
          ],
        ),
      ),
    );
  }
}
