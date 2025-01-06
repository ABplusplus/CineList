import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://api.simkl.com/",
        contentType: "application/json",
        headers: {
          //"Authorization": "c73b230b69f7eebda2a1b171f2a65a3ff0b0c7173d6574c04681b24996440069",
        },
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody:
    true, requestHeader: true ,requestBody: true));

    return dio;
  }
}
