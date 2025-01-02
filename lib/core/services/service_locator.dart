import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/networking/dio_factory.dart';
import 'package:news_app/features/news/data/apis_news/api_const.dart';
import 'package:news_app/features/news/data/apis_news/api_news.dart';
import 'package:news_app/features/news/data/repo/news_repo.dart';
import 'package:news_app/features/news/logic/news_cubit/news_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // تسجيل Dio
  // الحصول على SharedPreferences وتسجيل SharedPrefHelper

  Dio dio = DioFactory.getDio();

  getIt.registerFactory(() => NewsCubit(getIt())) ;

  getIt.registerLazySingleton(() => NewsRepo(getIt()))  ;

  getIt.registerLazySingleton(() => NewsWebServices(dio))  ;

}
