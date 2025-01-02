import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/base_widgets/custom_app_bar.dart';
import 'package:news_app/core/services/service_locator.dart';
import 'package:news_app/features/news/logic/news_cubit/news_cubit.dart';
import 'package:news_app/features/news/logic/news_cubit/news_state.dart';
import 'package:news_app/features/news/widget/get_news_data.dart';
import '../../../core/helper/spacing.dart';
import '../widget/news_carousel_slider_widget.dart';

class ScienceNewsScreen extends StatelessWidget {
  const ScienceNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsCubit>(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return  Scaffold(
            appBar: CustomAppBar(
              appBarTitle: 'science'.tr(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  NewsCarouselSliderWidget(), // Pass the first article
                  verticalSpace(16),
                  const GetNewsDataWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
