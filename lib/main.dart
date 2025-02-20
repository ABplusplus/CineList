import 'package:flutter/material.dart';
import 'package:cinelist/ui/home_page.dart';
import 'package:cinelist/ui/search_page.dart';
import 'package:cinelist/ui/detail_page.dart';
import 'package:cinelist/domains/api/cinelist_api_service.dart';
import 'package:cinelist/domains/api/dio_client.dart';
import 'package:cinelist/repositories/series_repository.dart';

void main() {

  final dio = DioClient.createDio();
  final apiService = CinelistApiService(dio);


  final seriesRepository = SeriesRepository(apiClient: apiService);

  runApp(MyApp(
    seriesRepository: seriesRepository
  ));
}

class MyApp extends StatelessWidget {

  final SeriesRepository seriesRepository;

  const MyApp({
    super.key,
    required this.seriesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineList',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
          seriesRepository: seriesRepository,
        ),
        '/search': (context) => SearchPage(
          seriesRepository: seriesRepository,
        ),
        '/detail': (context) => const MovieDetailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
