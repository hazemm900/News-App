import 'package:news_app/core/networking/api_error_model.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsSuccessState extends NewsState {}

final class NewsLoadingState extends NewsState {}

final class NewsErrorState extends NewsState {
  final ApiErrorModel apiErrorModel;

  NewsErrorState(this.apiErrorModel);
}
