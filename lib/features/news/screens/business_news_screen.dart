import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/base_widgets/custom_app_bar.dart';
import 'package:news_app/core/helper/spacing.dart';
import 'package:news_app/core/services/service_locator.dart';
import 'package:news_app/features/news/logic/news_cubit/news_cubit.dart';
import 'package:news_app/features/news/logic/news_cubit/news_state.dart';
import 'package:news_app/features/news/widget/get_news_data.dart';
import 'package:news_app/features/news/widget/news_carousel_slider_widget.dart';

class BusinessNewsScreen extends StatelessWidget {
  const BusinessNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsCubit>()..getNewsData(newsCategory: "business"),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          var articles = cubit.newsModel?.articles;

          if (articles == null || articles.isEmpty) {
            // Show a loading indicator if data isn't ready
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Scaffold(
            appBar: const CustomAppBar(
              appBarTitle: 'Business',
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
