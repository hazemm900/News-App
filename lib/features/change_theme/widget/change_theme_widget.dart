import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:news_app/features/change_theme/change_theme_cubit/change_theme_cubit.dart';
import 'package:news_app/features/change_theme/change_theme_cubit/change_theme_state.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        var cubit = ChangeThemeCubit.get(context);
        return IconButton(
            onPressed: () {
              cubit.changeTheme();
              Phoenix.rebirth(context);
            }, icon: const Icon(Icons.dark_mode_outlined, color: Colors.white,));
      },
    );
  }
}
