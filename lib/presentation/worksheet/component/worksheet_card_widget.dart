import 'package:flutter/material.dart';

import '../../../ui/text_styles.dart';

class WorksheetCardWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String imageUrl;
  final void Function() onTab;

  const WorksheetCardWidget({
    super.key,
    required this.title,
    required this.color,
    required this.onTab, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(top: 16, bottom: 4, left: 6, right: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(imageUrl),
            ),
            const Spacer(),
            Text(
              title,
              style: Fonts.smallerTextBold,
            ),
          ],
        ),
      ),
    );
  }
}
