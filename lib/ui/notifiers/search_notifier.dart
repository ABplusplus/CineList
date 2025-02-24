import 'package:flutter/material.dart';
import 'package:cinelist/repositories/series_repository.dart';
import 'package:cinelist/models/tv_item.dart';
import 'package:cinelist/models/tv_item_with_date.dart';
import 'package:cinelist/models/tvs.dart';

class SearchNotifier extends ChangeNotifier {
  final SeriesRepository seriesRepository;
  final TextEditingController searchController = TextEditingController();

  List<dynamic> _searchResults = [];
  List<dynamic> _filteredResults = [];
  bool _isLoading = false;

  SearchNotifier({required this.seriesRepository}) {
    fetchSearchResults();
    searchController.addListener(filterSearchResults);
  }

  List<dynamic> get searchResults => _searchResults;
  List<dynamic> get filteredResults => _filteredResults;
  bool get isLoading => _isLoading;

  Future<void> fetchSearchResults() async {
    _isLoading = true;
    notifyListeners();
    try {
      final TVs series = await seriesRepository.fetchSeries();
      final TVs anime = await seriesRepository.fetchAnime();

      Set<String> uniqueTitles = {};

      List<TvItem> tvItems = [
        ...series.mostWatchedThisMonth,
        ...series.premieres,
        ...anime.mostWatchedThisMonth,
        ...anime.premieres,
      ].where((item) => uniqueTitles.add(item.title)).toList();

      List<TvItemWithDate> tvItemsWithDate = [
        ...series.topLastAired,
        ...anime.topLastAired,
      ].where((item) => uniqueTitles.add(item.title)).toList();

      _searchResults = [...tvItems, ...tvItemsWithDate]..sort((a, b) => a.title.compareTo(b.title));
      _filteredResults = List.from(_searchResults); // Initialize filtered results

    } catch (e) {
      print("Error fetching search results: $e");
    }
    _isLoading = false;
    notifyListeners();
  }

  void filterSearchResults() {
    String query = searchController.text.toLowerCase();
    _filteredResults = _searchResults.where((item) => item.title.toLowerCase().contains(query)).toList();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
