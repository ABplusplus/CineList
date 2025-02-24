import 'package:cinelist/models/with_id/episode_item.dart';
import 'package:cinelist/models/with_id/item_by_id.dart';
import 'package:cinelist/models/with_id/user_recommendation.dart';
import 'package:provider/provider.dart';
import 'package:cinelist/repositories/series_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cinelist/widgets/bottom_nav_bar.dart'; // Import the BottomNavBar widget
import 'package:cinelist/ui/notifiers/detail_notifier.dart';

class MovieDetailPage extends StatelessWidget {
  final int id;

  const MovieDetailPage({Key? key, required this.id}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final seriesRepo = Provider.of<SeriesRepository>(context, listen: false);

    return ChangeNotifierProvider(
      create: (_) => DetailNotifier(seriesRepository: seriesRepo)..fetchDetail(id),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.bookmark_border, color: Colors.black),
              onPressed: () {
              },
            ),
          ],
        ),
        body: Consumer<DetailNotifier>(
          builder: (context, detailNotifier, child) {
            if (detailNotifier.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (detailNotifier.seriesDetails == null) {
              return const Center(child: Text("Aucune donnée"));
            }

            final ItemById details = detailNotifier.seriesDetails!;
            final List<EpisodeItem> episodes = detailNotifier.episodes;
            final List<UserRecommendation> recommendations = details.usersRecommendations ?? [];

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "https://simkl.in/posters/${details.poster}_w.webp",
                        width: double.infinity,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                      const Positioned(
                        bottom: 16,
                        right: 16,
                        child: Icon(
                          Icons.favorite,
                          size: 32,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),

                  // Informations principales
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          details.title ?? "",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${details.year} • ${details.network} • ${details.status}",
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.timer, size: 20),
                                const SizedBox(width: 4),
                                Text("${details.runtime} min"),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF6F61),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Trailer",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      details.overview ?? "",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Section Episodes
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Episodes",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ScrollableEpisodeList(episodes: episodes),
                  const SizedBox(height: 24),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Recommandations",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  HorizontalRecommendationList(
                    recommendations: recommendations,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


class ScrollableEpisodeList extends StatelessWidget {
  final List<EpisodeItem> episodes;

  const ScrollableEpisodeList({Key? key, required this.episodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filtrer les épisodes avec season et episode non null
    final validEpisodes = episodes
        .where((ep) => ep.season != null && ep.episode != null)
        .toList();

    // Trier par ordre décroissant (d'abord par season, puis par episode)
    validEpisodes.sort((a, b) {
      final seasonComparison = b.season!.compareTo(a.season!);
      if (seasonComparison != 0) {
        return seasonComparison;
      }
      return b.episode!.compareTo(a.episode!);
    });

    return SizedBox(
      height: 250, // Hauteur fixe pour le conteneur des épisodes
      child: ListView.builder(
        itemCount: validEpisodes.length,
        itemBuilder: (context, index) {
          final episode = validEpisodes[index];
          final formattedDate = DateFormat("dd MMM yyyy 'à' HH:mm", 'fr')
              .format(episode.date ?? DateTime.now());
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Season ${episode.season}, Ep ${episode.episode}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formattedDate,
                  style: const TextStyle(color: Colors.grey),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HorizontalRecommendationList extends StatelessWidget {
  final List<UserRecommendation> recommendations;

  const HorizontalRecommendationList({
    Key? key,
    required this.recommendations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // Hauteur fixe pour la liste horizontale
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final rec = recommendations[index];
          final posterUrl = rec.poster != null
              ? "https://simkl.in/posters/${rec.poster}_ca.webp"
              : null;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(
                    id: rec.ids?.simkl ?? 0,
                  ),
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
                  image: posterUrl != null
                      ? DecorationImage(
                    image: NetworkImage(posterUrl),
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