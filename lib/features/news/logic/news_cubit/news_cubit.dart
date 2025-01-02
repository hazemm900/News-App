import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helper/sheared_preference.dart';
import 'package:news_app/features/news/data/model/news_model.dart';
import 'package:news_app/features/news/data/model/news_model_request.dart';
import 'package:news_app/features/news/logic/news_cubit/news_state.dart';

import '../../data/repo/news_repo.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo _newsRepo;

  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModel;

  NewsCubit(this._newsRepo) : super(NewsInitial());

  void getNewsData({required String newsCategory}) async {
    emit(NewsLoadingState());
    final result = await _newsRepo.getNewsData(NewsModelRequest(
        language: CacheHelper.getData(key: "lang") == "en" ? "en" : "ar",
        apiKey: "9bea17d1ed014375a4156ef51c6a8abe",
        category: newsCategory));
    result.when(success: (response) {
      newsModel = response;
      emit(NewsSuccessState());
    }, failure: (error) {
      emit(NewsErrorState(error));
    });
  }
}
