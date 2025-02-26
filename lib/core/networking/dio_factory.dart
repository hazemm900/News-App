import 'package:dio/dio.dart';
import 'package:news_app/core/helper/sheared_preference.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 100);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Authorization': 'Bearer ${await CacheHelper.getData(key: "token")}',
      // 'Accept': 'application/json',
      // "lang": await sharedPrefHelper.getData(key: "lang") ?? "ar",
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) async {
    // SharedPrefHelper sharedPrefHelper = getIt<SharedPrefHelper>();
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      // "lang": await sharedPrefHelper.getData(key: "lang") ?? "ar",
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
