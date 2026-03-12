import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/language_cubit.dart';
import 'package:islamic/features/home/presentation/view/home_view.dart';
import 'package:islamic/generated/l10n.dart';

class Islamic extends StatelessWidget {
  const Islamic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          home: HomeView(),

          debugShowCheckedModeBanner: false,

          locale: locale,

          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData.dark(useMaterial3: true),

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
