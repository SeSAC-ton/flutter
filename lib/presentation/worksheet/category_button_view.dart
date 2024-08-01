import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ui/color_styles.dart';
import '../../util/constant.dart';
import 'component/category_button.dart';
import 'worksheet_view_model.dart';

class CategoryButtonView extends StatelessWidget {
  const CategoryButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WorksheetViewModel>();
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: [
          CategoryButton(
            backgroundColor:
                viewModel.selectedCategory == Category.personal.title
                    ? Category.personal.color
                    : ColorStyles.white,
            icon: Icons.home,
            iconColor: viewModel.selectedCategory != Category.personal.title
                ? Category.personal.color
                : ColorStyles.white,
            label: Category.personal.title,
            onPressed: () => viewModel.selectCategory(Category.personal.title),
          ),
          CategoryButton(
            backgroundColor: viewModel.selectedCategory == Category.social.title
                ? Category.social.color
                : ColorStyles.white,
            icon: Icons.group,
            iconColor: viewModel.selectedCategory != Category.social.title
                ? Category.social.color
                : ColorStyles.white,
            label: Category.social.title,
            onPressed: () => viewModel.selectCategory(Category.social.title),
          ),
          CategoryButton(
            backgroundColor:
                viewModel.selectedCategory == Category.relation.title
                    ? Category.relation.color
                    : ColorStyles.white,
            icon: Icons.person,
            iconColor: viewModel.selectedCategory != Category.relation.title
                ? Category.relation.color
                : ColorStyles.white,
            label: Category.relation.title,
            onPressed: () => viewModel.selectCategory(Category.relation.title),
          ),
          CategoryButton(
            backgroundColor: viewModel.selectedCategory == Category.job.title
                ? Category.job.color
                : ColorStyles.white,
            icon: Icons.work,
            iconColor: viewModel.selectedCategory != Category.job.title
                ? Category.job.color
                : ColorStyles.white,
            label: Category.job.title,
            onPressed: () => viewModel.selectCategory(Category.job.title),
          ),
        ],
      ),
    );
  }
}
