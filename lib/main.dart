import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:cinelist/ui/home_page.dart';
import 'package:cinelist/ui/search_page.dart';
import 'package:cinelist/ui/detail_page.dart';
import 'package:cinelist/domains/api/cinelist_api_service.dart';
import 'package:cinelist/domains/api/dio_client.dart';
import 'package:cinelist/repositories/series_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr', null);

  final dio = DioClient.createDio();
  final apiService = CinelistApiService(dio);
  final seriesRepository = SeriesRepository(apiClient: apiService);

  runApp(
    MultiProvider(
      providers: [
        // Ici, on met le Provider de SeriesRepository
        Provider<SeriesRepository>(
          create: (_) => seriesRepository,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineList',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {
          final sr = Provider.of<SeriesRepository>(context, listen: false);
          return HomePage(seriesRepository: sr);
        },
        '/search': (context) {
          final sr = Provider.of<SeriesRepository>(context, listen: false);
          return SearchPage(seriesRepository: sr);
        },
        '/detail': (context) => const MovieDetailPage(id: 0),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
