import 'package:json_annotation/json_annotation.dart';
import 'airs.dart';
import 'ids_by_id.dart';
import 'ratings_by_id.dart';
import 'trailer.dart';
import 'user_recommendation.dart';

part 'item_by_id.g.dart';

@JsonSerializable()
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
  final List<UserRecommendation> usersRecommendations;

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
    required this.usersRecommendations,
  });

  factory ItemById.fromJson(Map<String, dynamic> json) => _$ItemByIdFromJson(json);

  Map<String, dynamic> toJson() => _$ItemByIdToJson(this);
}
