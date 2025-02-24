import 'package:flutter/material.dart';
import 'package:cinelist/repositories/series_repository.dart';
import 'package:cinelist/models/with_id/item_by_id.dart';
import 'package:cinelist/models/with_id/episode_item.dart';

class DetailNotifier extends ChangeNotifier {
  final SeriesRepository seriesRepository;

  bool isLoading = false;
  ItemById? seriesDetails;
  List<EpisodeItem> episodes = [];

  DetailNotifier({required this.seriesRepository});

  Future<void> fetchDetail(int id) async {
    try {
      isLoading = true;
      notifyListeners();

      final detail = await seriesRepository.fetchSeriesDetails(id);
      seriesDetails = detail;

      final simklId = detail.ids?.simkl;
      final eps = await seriesRepository.fetchEpisodesByTVId(simklId!);
      episodes = eps;
    } catch (e) {
      print("Error fetching detail: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}