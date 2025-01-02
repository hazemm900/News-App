import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/service_locator.dart';
import 'package:news_app/features/change_theme/change_theme_cubit/change_theme_cubit.dart';
import 'package:news_app/features/change_theme/change_theme_cubit/change_theme_state.dart';
import 'package:news_app/features/custom_bottom_nav_bar/screens/custom_bottom_nav_bar.dart';
import 'package:news_app/features/news/data/apis_news/api_news.dart';
import 'package:news_app/features/news/data/repo/news_repo.dart';
import 'package:news_app/features/news/logic/news_cubit/news_cubit.dart';

import 'core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          var cubit = ChangeThemeCubit.get(context);
          return MaterialApp(
              title: 'NewsApp',
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const CustomBottomNavBar());
        },
      ),
    );
  }
}
