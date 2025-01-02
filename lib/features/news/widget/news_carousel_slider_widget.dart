import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/service_locator.dart';
import 'package:news_app/features/news/data/model/news_model.dart';
import 'package:news_app/features/news/logic/news_cubit/news_cubit.dart';
import 'package:news_app/features/news/logic/news_cubit/news_state.dart';
import 'package:news_app/features/news/screens/news_web_view_screen.dart';

class NewsCarouselSliderWidget extends StatelessWidget {
  // final Articles articlesNews;
  //
  // const NewsCarouselSliderWidget({super.key, required this.articlesNews});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var articles = cubit.newsModel?.articles;

        if (articles == null || articles.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Use the first 5 articles
        final firstFiveArticles = articles.take(5).toList();

        return

          CarouselSlider(
          options: CarouselOptions(
            height: 170,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOut,
          ),
          items: firstFiveArticles.map((article) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the web view when tapped
                    if (article.url != null && article.url!.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsWebViewScreen(
                            url:article.url!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("No URL available for this article."),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage ?? "",
                      placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 50),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
