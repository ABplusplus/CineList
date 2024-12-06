import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://api.simkl.com/",
        contentType: "application/json",
        headers: {
          "Authorization": "6103e09af69da6887c2e4dbd8bc2b61a0d691ec11ac9dd2a143c05a120c9b8e3", // Replace with actual key
        },
      ),
    );
    // Optional: Add interceptors for logging or error handling
    dio.interceptors.add(LogInterceptor(responseBody:
    true, requestHeader: true ,requestBody: true));

    return dio;
  }
}
