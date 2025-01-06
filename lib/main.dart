import 'package:flutter/material.dart';
import 'package:cinelist/ui/home_page.dart';
import 'package:cinelist/ui/search_page.dart';
import 'package:cinelist/ui/detail_page.dart';
import 'package:cinelist/domains/api/cinelist_api_service.dart';
import 'package:cinelist/domains/api/dio_client.dart';
import 'package:cinelist/repositories/anime_repository.dart';
import 'package:cinelist/repositories/series_repository.dart';

void main() {

  final dio = DioClient.createDio();
  final apiService = CinelistApiService(dio);


  final animeRepository = AnimeRepository(apiClient: apiService);
  final seriesRepository = SeriesRepository(apiClient: apiService);

  runApp(MyApp(
    animeRepository: animeRepository,
    seriesRepository: seriesRepository,
  ));
}

class MyApp extends StatelessWidget {
  final AnimeRepository animeRepository;
  final SeriesRepository seriesRepository;

  const MyApp({
    super.key,
    required this.animeRepository,
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
          animeRepository: animeRepository,
          seriesRepository: seriesRepository,
        ),
        '/search': (context) => SearchPage(
          animeRepository: animeRepository,
          seriesRepository: seriesRepository,
        ),
        '/detail': (context) => const MovieDetailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
