import 'package:json_annotation/json_annotation.dart';
import 'airs.dart';
import 'ids_by_id.dart';
import 'ratings_by_id.dart';
import 'trailer.dart';
import 'user_recommendation.dart';

part 'item_by_id.g.dart';

@JsonSerializable()
class ItemById {
  final String? title;
  final int? year;
  final String? type;
  final IdsById? ids;
  final String? yearStartEnd;
  final int? rank;
  final String? poster;
  final String? fanart;
  final String? firstAired;
  @JsonKey(fromJson: _nullableString)
  final String? lastAired;
  final Airs? airs;
  final int? runtime;
  @JsonKey(fromJson: _nullableString)
  final String? certification;
  final String? overview;
  final List<String>? genres;
  final String? country;
  final int? totalEpisodes;
  final String? status;
  final String? network;
  final RatingsById? ratings;
  final List<Trailer>? trailers;
  @JsonKey(name: "users_recommendations")
  final List<UserRecommendation>? usersRecommendations;

  ItemById({
    this.title,
    this.year,
    this.type,
    this.ids,
    this.yearStartEnd,
    this.rank,
    this.poster,
    this.fanart,
    this.firstAired,
    this.lastAired,
    this.airs,
    this.runtime,
    this.certification,
    this.overview,
    this.genres,
    this.country,
    this.totalEpisodes,
    this.status,
    this.network,
    this.ratings,
    this.trailers,
    this.usersRecommendations,
  });

  factory ItemById.fromJson(Map<String, dynamic> json) =>
      _$ItemByIdFromJson(json);

  Map<String, dynamic> toJson() => _$ItemByIdToJson(this);

  static String? _nullableString(dynamic value) =>
      value == null ? null : value as String;
}
