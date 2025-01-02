import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_constants.dart';
import 'package:news_app/features/news/data/apis_news/api_const.dart';
import 'package:news_app/features/news/data/model/news_model.dart';
import 'package:news_app/features/news/data/model/news_model_request.dart';
import 'package:retrofit/retrofit.dart';

part 'api_news.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class NewsWebServices {
  factory NewsWebServices(Dio dio, {String? baseUrl}) = _NewsWebServices;

  @GET(NewsConst.newsEndPoint)
  Future<NewsModel> getNewsData(
    @Queries() NewsModelRequest newsModelRequest,
  );
}
