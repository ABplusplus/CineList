import 'package:cinelist/models/new_episodes.dart';
import 'package:cinelist/models/tv_item_with_date.dart';
import 'package:flutter/material.dart';
import 'package:cinelist/repositories/anime_repository.dart';
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
  final AnimeRepository animeRepository;
  final SeriesRepository seriesRepository;

  const HomePage({
    Key? key,
    required this.animeRepository,
    required this.seriesRepository,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TopAiredFanart> trendingAnime = [];
  List<TvItem> mostWatchedThisMonth = [];
  List<TvItem> premieres = [];
  List<TvItemWithDate> topLastAired = [];
  NewEpisodes? newEpisodes;
  //TrendingAnime? trendingAnime;


  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSeries();
    fetchPremieres();
    fetchTopLastAired();
    //fetchNewEpisodes();
  }

  // Future<void> fetchTrendingAnime() async {
  //   try {
  //     final anime = await widget.animeRepository.fetchTrendingAnime();
  //     setState(() {
  //       trendingAnime = anime.;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print("Error fetching anime: $e");
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  Future<void> fetchSeries() async {
    try {
      final series = await widget.seriesRepository.fetchSeries();
      setState(() {
        mostWatchedThisMonth = series.mostWatchedThisMonth ?? [];
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching series: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchPremieres() async {
    try {
      final series = await widget.seriesRepository.fetchSeries();
      setState(() {
        premieres = series.premieres ?? [];
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching series: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchTopLastAired() async {
    try {
      final series = await widget.seriesRepository.fetchTopLastAired();
      setState(() {
        topLastAired = series.topLastAired ?? [];
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching series: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  // Future<void> fetchNewEpisodes() async {
  //   try {
  //     final series = await widget.seriesRepository.fetchSeries();
  //     if (newEpisodes?.today.items.all != null) {
  //       setState(() {
  //           newEpisodes = series.newEpisodes;
  //           isLoading = false;
  //         }
  //       );
  //     }
  //   } catch (e) {
  //     print("Error fetching new episodes: $e");
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

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
                  height: 260,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF6F61), // Coral background
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.02, // 2% from the top
                  left: MediaQuery.of(context).size.width * 0.05, // 5% from the left
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Add border radius
                    child: Image.asset(
                      'assets/hunter_x_hunter.jpg',
                      width: MediaQuery.of(context).size.width * 0.9, // 90% of the screen width
                      height: MediaQuery.of(context).size.height * 0.25, // 25% of the screen height
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Buttons for "Shows" and "Anime"
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Shows" button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Shows",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Anime" button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20), // Top-right corner
                        bottomRight: Radius.circular(20), // Bottom-right corner
                      ),
                    ),
                  ),
                  child: const Text(
                    "Anime",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),

            const SizedBox(height: 16),

            const SectionTitle(title: "Trending"),

            // Trending Anime Section
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : HorizontalCardList(items: mostWatchedThisMonth),

            const SectionTitle(title: "Les plus vus"),
            HorizontalCardList(items: mostWatchedThisMonth),

            // New Episodes Section
            const SectionTitle(title: "Nouveaux épisodes"),
            //if (newEpisodes?.today?.items.all != null)
            HorizontalCardList(items: mostWatchedThisMonth /*newEpisodes!.today.items.all*/),

            const SectionTitle(title: "Les premières"),
            HorizontalCardList(items: premieres),

            const SectionTitle(title: "Les nouveautés"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(width: 16),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle "Today" button press
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.indigo,
                //     shape: const RoundedRectangleBorder(
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         bottomLeft: Radius.circular(20),
                //       ),
                //     ),
                //   ),
                //   child: const Text(
                //     "Today",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle "Yesterday" button press
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.red,
                //     shape: const RoundedRectangleBorder(
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(20),
                //         bottomRight: Radius.circular(20),
                //       ),
                //     ),
                //   ),
                //   child: const Text(
                //     "Yesterday",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 8),
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
              // Navigate to the MovieDetailPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MovieDetailPage(), // Replace with actual movie data
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

class HorizontalCardList2 extends StatelessWidget {
  final List<Episode> items;

  const HorizontalCardList2({Key? key, required this.items}) : super(key: key);

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
              // Navigate to the MovieDetailPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MovieDetailPage(), // Replace with actual movie data
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
              // Navigate to the MovieDetailPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MovieDetailPage(), // Replace with actual movie data
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