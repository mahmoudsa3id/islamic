import 'package:flutter/material.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/features/home/data/models/category_models.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey.shade800),
        color: ColorManager.darkgrey1category,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: categoryModel.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              categoryModel.icon,
              color: categoryModel.iconcolor,
              size: 20,
            ),
          ),
          verticalSpace(5),
          Text(categoryModel.name),
        ],
      ),
    );
  }
}
