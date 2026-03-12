import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/di/service_locator.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/language_cubit.dart';

import 'package:islamic/islamic_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(
    BlocProvider(create: (context) => LanguageCubit(), child: const Islamic()),
  );
}
