import 'IdsById.dart';
import 'RatingsById.dart';
import 'Trailer.dart';
import 'UserRecommendation.dart';

class ItemById {
  final String title;
  final int year;
  final String type;
  final IdsById ids;
  final String yearStartEnd;
  final int rank;
  final String poster;
  final String fanart;
  final String firstAired;
  final String lastAired;
  final Airs airs;
  final int runtime;
  final String certification;
  final String overview;
  final List<String> genres;
  final String country;
  final int totalEpisodes;
  final String status;
  final String network;
  final RatingsById ratings;
  final List<Trailer> trailers;
  final List<UserRecommendation> userRecommendations;

  ItemById({
    required this.title,
    required this.year,
    required this.type,
    required this.ids,
    required this.yearStartEnd,
    required this.rank,
    required this.poster,
    required this.fanart,
    required this.firstAired,
    required this.lastAired,
    required this.airs,
    required this.runtime,
    required this.certification,
    required this.overview,
    required this.genres,
    required this.country,
    required this.totalEpisodes,
    required this.status,
    required this.network,
    required this.ratings,
    required this.trailers,
    required this.userRecommendations,
  });

  factory ItemById.fromJson(Map<String, dynamic> json) {
    return ItemById(
      title: json['title'],
      year: json['year'],
      type: json['type'],
      ids: IdsById.fromJson(json['ids']),
      yearStartEnd: json['year_start_end'],
      rank: json['rank'],
      poster: json['poster'],
      fanart: json['fanart'],
      firstAired: json['first_aired'],
      lastAired: json['last_aired'],
      airs: Airs.fromJson(json['airs']),
      runtime: json['runtime'],
      certification: json['certification'],
      overview: json['overview'],
      genres: List<String>.from(json['genres']),
      country: json['country'],
      totalEpisodes: json['total_episodes'],
      status: json['status'],
      network: json['network'],
      ratings: RatingsById.fromJson(json['ratings']),
      trailers: (json['trailers'] as List)
          .map((trailer) => Trailer.fromJson(trailer))
          .toList(),
      userRecommendations: (json['users_recommendations'] as List)
          .map((recommendation) =>
          UserRecommendation.fromJson(recommendation))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'year': year,
      'type': type,
      'ids': ids.toJson(),
      'year_start_end': yearStartEnd,
      'rank': rank,
      'poster': poster,
      'fanart': fanart,
      'first_aired': firstAired,
      'last_aired': lastAired,
      'airs': airs.toJson(),
      'runtime': runtime,
      'certification': certification,
      'overview': overview,
      'genres': genres,
      'country': country,
      'total_episodes': totalEpisodes,
      'status': status,
      'network': network,
      'ratings': ratings.toJson(),
      'trailers': trailers.map((trailer) => trailer.toJson()).toList(),
      'users_recommendations':
      userRecommendations.map((rec) => rec.toJson()).toList(),
    };
  }
}
