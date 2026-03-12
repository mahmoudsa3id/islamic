import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/routing/app_route.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/language_cubit.dart';
import 'package:islamic/features/home/presentation/view/home_view.dart';
import 'package:islamic/generated/l10n.dart';

class Islamic extends StatelessWidget {
  const Islamic({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          theme: ThemeData.dark(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: ColorManager.darkgreen1,
            textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
          ),
          onGenerateRoute: appRouter.generateRoute,
          home: HomeView(),

          debugShowCheckedModeBanner: false,

          locale: locale,

          supportedLocales: S.delegate.supportedLocales,

          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
