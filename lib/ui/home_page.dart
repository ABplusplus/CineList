import 'package:cinelist/models/new_episodes.dart';
import 'package:cinelist/models/tv_item_with_date.dart';
import 'package:flutter/material.dart';
import 'package:cinelist/repositories/series_repository.dart';
import 'package:cinelist/models/top_aired_fanart.dart';
import 'package:cinelist/models/tvs.dart';
import 'package:cinelist/models/episode.dart';
import 'package:cinelist/models/tv_item.dart';
import 'package:cinelist/widgets/bottom_nav_bar.dart';
import 'package:cinelist/ui/detail_page.dart';

import '../models/items.dart';
import '../models/today.dart';
import '../models/tv_item.dart';
import '../models/yesterday.dart';

class HomePage extends StatefulWidget {
  final SeriesRepository seriesRepository;

  const HomePage({
    Key? key,
    required this.seriesRepository,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TvItem> mostWatchedThisMonth = [];
  List<TvItem> premieres = [];
  List<TvItemWithDate> topLastAired = [];
  bool isLoading = true;
  bool isAnimeSelected = false; // Ajout du booléen pour l'alternance

  @override
  void initState() {
    super.initState();
    fetchSeries(); // Chargement par défaut des séries
  }

  Future<void> fetchSeries() async {
    setState(() => isLoading = true);
    try {
      final series = await widget.seriesRepository.fetchSeries();
      setState(() {
        mostWatchedThisMonth = series.mostWatchedThisMonth ?? [];
        premieres = series.premieres ?? [];
        topLastAired = series.topLastAired ?? [];
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching series: $e");
      setState(() => isLoading = false);
    }
  }

  Future<void> fetchAnime() async {
    setState(() => isLoading = true);
    try {
      final anime = await widget.seriesRepository.fetchAnime();
      setState(() {
        mostWatchedThisMonth = anime.mostWatchedThisMonth ?? [];
        premieres = anime.premieres ?? [];
        topLastAired = anime.topLastAired ?? [];
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching anime: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(currentRoute: '/'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Stack(
              children: [
                Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF6F61), // Coral background
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.02, // 2% du haut
                  left: MediaQuery.of(context).size.width * 0.05, // 5% de la largeur
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Ajout d'un arrondi
                    child: Image.asset(
                      'assets/hunter_x_hunter.jpg',
                      width: MediaQuery.of(context).size.width * 0.9, // 90% de la largeur
                      height: MediaQuery.of(context).size.height * 0.25, // 25% de la hauteur
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Boutons "Shows" et "Anime"
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (isAnimeSelected) {
                      setState(() {
                        isAnimeSelected = false;
                        fetchSeries();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAnimeSelected ? Colors.grey : Colors.indigo,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text("Shows", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!isAnimeSelected) {
                      setState(() {
                        isAnimeSelected = true;
                        fetchAnime();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAnimeSelected ? Colors.red : Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text("Anime", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 16),
              ],
            ),

            const SizedBox(height: 16),

            const SectionTitle(title: "Trending"),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : HorizontalCardList(items: mostWatchedThisMonth),

            const SectionTitle(title: "Les plus vus"),
            HorizontalCardList(items: mostWatchedThisMonth),

            const SectionTitle(title: "Les premières"),
            HorizontalCardList(items: premieres),

            const SectionTitle(title: "Les nouveautés"),
            HorizontalCardList3(items: topLastAired),
          ],
        ),
      ),
    );
  }
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Listes d'éléments
class HorizontalCardList extends StatelessWidget {
  final List<TvItem> items;

  const HorizontalCardList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MovieDetailPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage("https://simkl.in/posters/${item.poster}_ca.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HorizontalCardList3 extends StatelessWidget {
  final List<TvItemWithDate> items;

  const HorizontalCardList3({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MovieDetailPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage("https://simkl.in/posters/${item.poster}_ca.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
