import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/features/home/data/models/category_models.dart';
import 'package:islamic/features/home/presentation/view/widgets/category_item.dart';
import 'package:islamic/generated/l10n.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});
  static List<CategoryModel> categoryModel(BuildContext context) {
    final tr = S.of(context);

    return [
      CategoryModel(
        name: tr.quran,
        icon: Icons.menu_book,
        color: Color(0xff173426),
        iconcolor: Color(0xff1A6B4A),
      ),
      CategoryModel(
        name: tr.prayer,
        icon: FontAwesomeIcons.clock,
        color: ColorManager.darkgreenbrown,
        iconcolor: ColorManager.yellow,
      ),
      CategoryModel(
        name: tr.qibla,
        icon: FontAwesomeIcons.compass,
        color: Color(0xff1A2E32),
        iconcolor: Color(0xff2A467C),
      ),
      CategoryModel(
        name: tr.azkar,
        icon: Icons.brightness_5,
        color: Color(0xff2C2E1D),
        iconcolor: Color(0xff8B4A1A),
      ),
      CategoryModel(
        name: tr.hadith,
        icon: FontAwesomeIcons.bookBookmark,
        color: Color(0xff26252C),
        iconcolor: Color(0xff5A1D5B),
      ),
      CategoryModel(
        name: tr.celender,
        icon: FontAwesomeIcons.calendar,
        color: Color(0xff17342C),
        iconcolor: Color(0xff1A6B6B),
      ),
      CategoryModel(
        name: tr.mosques,
        icon: Icons.mosque,
        color: Color(0xff26251D),
        iconcolor: Color(0xff6B1A1A),
      ),
      CategoryModel(
        name: tr.zakat,
        icon: Icons.calculate,
        color: Color(0xff20341D),
        iconcolor: Color(0xff3F5D1B),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 2,
        mainAxisSpacing: 7,

        childAspectRatio: 0.8,
      ),
      itemCount: categoryModel(context).length,
      itemBuilder: (context, index) {
        return CategoryItem(categoryModel: categoryModel(context)[index]);
      },
    );
  }
}
