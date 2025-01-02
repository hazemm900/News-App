import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/custom_bottom_nav_bar/logic/custom_bottom_nav_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          var cubit = BottomNavBarCubit.get(context);

          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w700),
                selectedIconTheme: const IconThemeData(size: 28),
                currentIndex: cubit.currentIndex,
                onTap: (value) {
                  cubit.changeCurrentIndex(value);
                },
                items:  [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.newspaper_outlined),
                      label: 'business'.tr()),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.sports_outlined),
                      label: 'sports'.tr()),
                  BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.science_outlined,
                      ),
                      label: 'science'.tr()),
                ]),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
