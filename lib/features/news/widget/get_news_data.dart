import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/service_locator.dart';
import 'package:news_app/core/theme/color.dart';
import 'package:news_app/features/news/logic/news_cubit/news_cubit.dart';
import 'package:news_app/features/news/logic/news_cubit/news_state.dart';

class GetNewsDataWidget extends StatelessWidget {
  const GetNewsDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return cubit.newsModel == null
            ? const Center(child: CircularProgressIndicator(color: MyColors.myRed,))
            : ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.newsModel!.articles!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SizedBox(
                  height: 150,
                  width: 140,
                  child: CachedNetworkImage(
                    imageUrl: cubit.newsModel?.articles?[index].urlToImage ?? "",
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 50),
                    fit: BoxFit.cover,
                  ),),
              title: Text(
                cubit.newsModel?.articles?[index].title ?? "",
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                children: [
                  Text(
                    cubit.newsModel?.articles?[index].description ?? "",
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "by ${cubit.newsModel?.articles?[index].author ?? ""}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: MyColors.myLightGrey,
                thickness: 0.8,
              ),
            );
          },
        );
      },
    );
  }
}
