import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islamic/core/helper/extension.dart';
import 'package:islamic/core/routing/routes.dart';
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
        color: const Color(0xff173426),
        iconcolor: const Color(0xff1A6B4A),
        routes: Routes.quranView,
      ),
      CategoryModel(
        name: tr.prayer,
        icon: FontAwesomeIcons.clock,
        color: ColorManager.darkgreenbrown,
        iconcolor: ColorManager.yellow,
        routes: Routes.prayerView,
      ),
      CategoryModel(
        name: tr.qibla,
        icon: FontAwesomeIcons.compass,
        color: const Color(0xff1A2E32),
        iconcolor: const Color(0xff2A467C),
        routes: Routes.qiblaView,
      ),
      CategoryModel(
        name: tr.azkar,
        icon: Icons.brightness_5,
        color: const Color(0xff2C2E1D),
        iconcolor: const Color(0xff8B4A1A),
        routes: Routes.azkarView,
      ),
      CategoryModel(
        name: tr.hadith,
        icon: FontAwesomeIcons.bookBookmark,
        color: const Color(0xff26252C),
        iconcolor: const Color(0xff5A1D5B),
        routes: Routes.hadithView,
      ),
      CategoryModel(
        name: tr.celender,
        icon: FontAwesomeIcons.calendar,
        color: const Color(0xff17342C),
        iconcolor: const Color(0xff1A6B6B),
        routes: Routes.celenderView,
      ),
      CategoryModel(
        name: tr.mosques,
        icon: Icons.mosque,
        color: const Color(0xff26251D),
        iconcolor: const Color(0xff6B1A1A),
        routes: Routes.mosqousView,
      ),
      CategoryModel(
        name: tr.zakat,
        icon: Icons.calculate,
        color: const Color(0xff20341D),
        iconcolor: const Color(0xff3F5D1B),
        routes: Routes.zakatView,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 10,

        childAspectRatio: 0.8,
      ),
      itemCount: categoryModel(context).length,
      itemBuilder: (context, index) {
        final item = categoryModel(context)[index];

        return InkWell(
          onTap: () => context.pushNamed(item.routes),
          child: CategoryItem(categoryModel: item),
        );
      },
    );
  }
}
