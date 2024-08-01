import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/problem/problem_view_model.dart';

import '../../data/model/worksheet/option.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/content_widget.dart';
import '../component/option_button.dart';
import '../component/title_widget.dart';

class ProblemView extends StatelessWidget {
  final void Function() workAnimation;

  const ProblemView({super.key, required this.workAnimation});

  @override
  Widget build(BuildContext context) {
    final int id = int.parse(GoRouterState.of(context).pathParameters['id']!);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Consumer<ProblemViewModel>(
        builder: (context, viewModel, child) {
          final problem = viewModel.explain;
          return (viewModel.isLoading)
              ? const Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(title: problem.title),
                    const SizedBox(height: 20),
                    ContentWidget(content: problem.content),
                    const SizedBox(height: 20),
                    ...problem.options.map(
                      (Option option) => OptionButton(
                        option: option,
                        onTap: () async {
                          if (!viewModel.isSolved) {
                            viewModel.solveProblem(id, option.id);
                            if (option.isAnswer) {
                              workAnimation();
                            }
                          }
                          await Future.delayed(const Duration(seconds: 3));
                          context.go('/home');
                        },
                        isSolved: viewModel.isSolved,
                      ),
                    ),
                    if (viewModel.errorMessage.isNotEmpty)
                      Text(
                        viewModel.errorMessage,
                        style: Fonts.smallerTextBold.copyWith(
                          color: ColorStyles.warningRed,
                        ),
                      ),
                  ],
                );
        },
      ),
    );
  }
}
