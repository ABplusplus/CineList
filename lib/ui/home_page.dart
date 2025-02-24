import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cinelist/repositories/series_repository.dart';
import 'package:cinelist/widgets/bottom_nav_bar.dart';
import 'package:cinelist/ui/detail_page.dart';
import 'package:cinelist/ui/notifiers/home_notifier.dart';
import 'package:cinelist/models/tv_item.dart';
import 'package:cinelist/models/tv_item_with_date.dart';
import 'package:cinelist/models/episode.dart';

class HomePage extends StatelessWidget {
  final SeriesRepository seriesRepository;

  const HomePage({
    Key? key,
    required this.seriesRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeNotifier(seriesRepository: seriesRepository)..fetchSeries(),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const BottomNavBar(currentRoute: '/'),
        body: Consumer<HomeNotifier>(
          builder: (context, homeNotifier, child) {
            return SingleChildScrollView(
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
                    children: [
                      ElevatedButton(
                        onPressed: () => homeNotifier.toggleCategory(false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: homeNotifier.isAnimeSelected ? Colors.grey : Colors.indigo,
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
                        onPressed: () => homeNotifier.toggleCategory(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: homeNotifier.isAnimeSelected ? Colors.red : Colors.grey,
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

                  const SectionTitle(title: "Nouveaux épisodes"),
                  homeNotifier.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : HorizontalEpisodeCardList(items: homeNotifier.newEpisodes),

                  const SectionTitle(title: "Les plus vus"),
                  HorizontalCardList(items: homeNotifier.mostWatchedThisMonth),

                  const SectionTitle(title: "Les premières"),
                  HorizontalCardList(items: homeNotifier.premieres),

                  const SectionTitle(title: "Les nouveautés"),
                  HorizontalCardList3(items: homeNotifier.topLastAired),
                ],
              ),
            );
          },
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

// Widget pour afficher horizontalement une liste d'épisodes
class HorizontalEpisodeCardList extends StatelessWidget {
  final List<Episode> items;

  const HorizontalEpisodeCardList({Key? key, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final episode = items[index];
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
                  image: episode.poster != null
                      ? DecorationImage(
                    image: NetworkImage(
                        "https://simkl.in/posters/${episode.poster}_ca.webp"),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
              ),
            ),
          );
        },
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
