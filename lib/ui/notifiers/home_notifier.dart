import 'package:flutter/material.dart';
import 'package:cinelist/models/new_episodes.dart';
import 'package:cinelist/models/tv_item_with_date.dart';
import 'package:cinelist/models/episode.dart';
import 'package:cinelist/models/tv_item.dart';
import 'package:cinelist/models/tvs.dart';
import 'package:cinelist/repositories/series_repository.dart';

class HomeNotifier extends ChangeNotifier {
  final SeriesRepository seriesRepository;

  List<TvItem> mostWatchedThisMonth = [];
  List<TvItem> premieres = [];
  List<TvItemWithDate> topLastAired = [];
  List<Episode> newEpisodes = [];
  bool isLoading = false;
  bool isAnimeSelected = false;

  HomeNotifier({required this.seriesRepository});

  /// Fetch series data
  Future<void> fetchSeries() async {
    _setLoading(true);
    try {
      final series = await seriesRepository.fetchSeries();
      mostWatchedThisMonth = series.mostWatchedThisMonth ?? [];
      premieres = series.premieres ?? [];
      topLastAired = series.topLastAired ?? [];
      newEpisodes = series.newEpisodes?.today?.items?.all ?? [];
    } catch (e) {
      print("Error fetching series: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchAnime() async {
    _setLoading(true);
    try {
      final anime = await seriesRepository.fetchAnime();
      mostWatchedThisMonth = anime.mostWatchedThisMonth ?? [];
      premieres = anime.premieres ?? [];
      topLastAired = anime.topLastAired ?? [];
      newEpisodes = anime.newEpisodes?.today?.items?.all ?? [];
    } catch (e) {
      print("Error fetching anime: $e");
    }
    _setLoading(false);
  }

  void toggleCategory(bool selectAnime) {
    isAnimeSelected = selectAnime;
    notifyListeners();
    if (isAnimeSelected) {
      fetchAnime();
    } else {
      fetchSeries();
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
