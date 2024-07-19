import 'package:flutter/material.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet_title.dart';

import '../../data/model/worksheet/worksheet.dart';
import '../../ui/color_styles.dart';

class WorksheetCardWidget extends StatelessWidget {
  final void Function() onTap;
  final WorksheetTitle worksheetTitle;

  const WorksheetCardWidget({
    super.key,
    required this.onTap,
    required this.worksheetTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: 40,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: ColorStyles.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: ColorStyles.primary100,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Text(
                  worksheetTitle.title,
                  style: const TextStyle(
                    color: ColorStyles.grey1,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.search,
                  color: ColorStyles.primary100,
                ),
              ],
            )),
      ),
    );
  }
}
