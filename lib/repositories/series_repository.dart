import 'package:cinelist/domains/api/cinelist_api_service.dart';
import 'package:cinelist/models/animes.dart';
import 'package:dio/dio.dart';
import 'package:cinelist/domains/api/dio_client.dart';

import '../models/tvs.dart';

class SeriesRepository {
  final CinelistApiService apiClient;

  SeriesRepository({required this.apiClient});

  Future<TVs> fetchSeries() async {
    try {
      return await apiClient.getTrendingSeries();
    } catch (e) {
      throw Exception("Failed to fetch series: $e");
    }
  }

  Future<TVs> fetchSeriesDetails(String id) async {
    try {
      return await apiClient.getSeriesDetails(id);
    } catch (e) {
      throw Exception("Failed to fetch series details: $e");
    }
  }
}
