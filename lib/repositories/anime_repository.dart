import 'package:cinelist/domains/api/cinelist_api_service.dart';
import 'package:cinelist/models/animes.dart';

import '../models/top_aired_fanart.dart';
//import '../../models/top_aired_fanart.dart';


class AnimeRepository {
  final CinelistApiService apiClient;

  AnimeRepository({required this.apiClient});

  Future<Animes> fetchAnime() async {
    try {
      return await apiClient.getTrendingAnime();
    } catch (e) {
      throw Exception("Failed to fetch anime: $e");
    }
  }

  Future<Animes> fetchAnimeDetails(String id) async {
    try {
      return await apiClient.getAnimeDetails(id);
    } catch (e) {
      throw Exception("Failed to fetch anime details: $e");
    }
  }



  Future<Animes> fetchTrendingAnime() async {
    try {
      final result = await apiClient.getTrendingAnime();
      return result;
    } catch (e) {
      throw Exception("Failed to fetch trending anime: $e");
    }
  }
}
