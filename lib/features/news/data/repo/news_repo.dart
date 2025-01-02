import 'package:news_app/core/networking/api_error_handler.dart';
import 'package:news_app/core/networking/api_result.dart';
import 'package:news_app/features/news/data/apis_news/api_news.dart';
import 'package:news_app/features/news/data/model/news_model.dart';
import 'package:news_app/features/news/data/model/news_model_request.dart';

class NewsRepo {
  final NewsWebServices _newsWebServices;

  NewsRepo(this._newsWebServices);

  Future<ApiResult<NewsModel>> getNewsData(NewsModelRequest newsModelRequest) async {
    try {
      final response = await _newsWebServices.getNewsData(newsModelRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
