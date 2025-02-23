import 'package:cinelist/domains/api/cinelist_api_service.dart';
import 'package:cinelist/models/with_id/episode_item.dart';
import 'package:cinelist/models/with_id/item_by_id.dart';
import 'package:dio/dio.dart';
import 'package:cinelist/domains/api/dio_client.dart';

import '../models/tv_item_with_date.dart';
import '../models/tvs.dart';

class SeriesRepository {
  final CinelistApiService apiClient;

  SeriesRepository({required this.apiClient});

  Future<TVs> fetchSeries() async {
    try {
      return await apiClient.getAllSeries();
    } catch (e) {
      throw Exception("Failed to fetch series: $e");
    }
  }

  // Fetch Anime (Ajouté)
  Future<TVs> fetchAnime() async {
    try {
      return await apiClient.getAllAnime();
    } catch (e) {
      throw Exception("Failed to fetch animes: $e");
    }
  }

  Future<ItemById> fetchSeriesDetails(String id) async {
    try {
      return await apiClient.getSeriesDetails(id);
    } catch (e) {
      throw Exception("Failed to fetch series details: $e");
    }
  }

  Future<List<EpisodeItem>> fetchEpisodesByTVId(String id) async {
    try {
      return await apiClient.getEpisodesByTVId(id);
    } catch (e) {
      throw Exception("Failed to fetch episodes for TV id $id: $e");
    }
  }

  Future<TVs> fetchTopLastAired() async {
    try {
      return await apiClient.getTrendingSeries();
    } catch (e) {
      throw Exception("Failed to fetch animes: $e");
    }
  }

}
