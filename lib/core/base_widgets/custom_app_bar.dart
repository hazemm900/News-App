import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/helper/change_lang.dart';
import 'package:news_app/core/theme/color.dart';
import 'package:news_app/features/change_theme/widget/change_theme_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const CustomAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title:  Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: appBarTitle,
              style: const TextStyle(
                color: MyColors.myRed, // Red for "FLY"
                fontWeight: FontWeight.bold,
                fontSize: 20, // Adjust font size as needed
              ),
            ),
             TextSpan(
              text: "news".tr(),
              style: const TextStyle(
                color: Colors.white, // White for "news"
                fontWeight: FontWeight.bold,
                fontSize: 20, // Match size for consistency
              ),
            ),
          ],
        ),
      ),
      actions: const [
        ChangeThemeWidget(),
        ChangeLang()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
