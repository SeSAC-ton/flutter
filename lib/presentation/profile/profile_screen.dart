import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet.dart';
import 'package:sesac_ton/presentation/component/warning_text.dart';
import 'package:sesac_ton/presentation/profile/profile_view_model.dart';
import 'package:sesac_ton/presentation/register/register_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../../util/constant.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';
import 'component/worksheet_card_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProfileViewModel>();
    final solveProblems = viewModel.solveProblems;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          serviceName,
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/mascot.png',
                  width: 170,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              '발자취',
              style: Fonts.largeTextBold.copyWith(
                color: ColorStyles.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: solveProblems.length,
                itemBuilder: (context, index) {
                  final solveProblem = solveProblems[index];
                  return WorksheetTitleWidget(
                    worksheet: Worksheet(
                      id: solveProblem.solvedWorksheetId.toString(),
                      category: '',
                      title: solveProblem.solvedWorksheetTitle,
                      imageUrl: '',
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
