import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/di/service_locator.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/next_prayer_cubit.dart';
import 'package:islamic/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getit<NextPrayerCubit>(),
        child: const HomeViewBody(),
      ),
    );
  }
}
