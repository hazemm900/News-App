import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helper/sheared_preference.dart';
import 'package:news_app/core/theme/color.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (context.locale.toString() == "en") {
          context.setLocale(const Locale('ar'));
          CacheHelper.saveData(key: "lang", value: "ar");
        } else {
          context.setLocale(const Locale('en'));
          CacheHelper.saveData(key: "lang", value: "en");
        }
        Phoenix.rebirth(context);
      },
      icon: const Icon(
        Icons.language_outlined,
        color: MyColors.myWhite,
      ),
    );
  }
}
