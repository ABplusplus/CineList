import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cinelist/repositories/series_repository.dart';
import 'package:cinelist/widgets/bottom_nav_bar.dart';
import 'package:cinelist/ui/detail_page.dart';
import 'package:cinelist/ui/notifiers/search_notifier.dart';

import '../models/tv_item_with_date.dart';

class SearchPage extends StatelessWidget {
  final SeriesRepository seriesRepository;

  const SearchPage({Key? key, required this.seriesRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchNotifier(seriesRepository: seriesRepository),
      child: Consumer<SearchNotifier>(
        builder: (context, notifier, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFFF6F61),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: notifier.searchController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: const Icon(Icons.search, color: Colors.indigo),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: notifier.isLoading
                ? const Center(child: CircularProgressIndicator())
                : notifier.filteredResults.isEmpty
                ? const Center(child: Text("No results found"))
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifier.filteredResults.length,
              itemBuilder: (context, index) {
                final item = notifier.filteredResults[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailPage(id: item.ids.simkl),
                      ),
                    );
                  },
                  child: FilmCard(item: item),
                );
              },
            ),
            bottomNavigationBar: const BottomNavBar(currentRoute: '/search'),
          );
        },
      ),
    );
  }
}

class FilmCard extends StatelessWidget {
  final dynamic item;

  const FilmCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = item.title;
    String description = item is TvItemWithDate ? item.bottomText : "More info";
    String posterUrl = "https://simkl.in/posters/${item.poster}_ca.webp";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              posterUrl,
              height: 120,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Ratings",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
