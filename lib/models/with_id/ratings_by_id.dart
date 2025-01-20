import 'package:json_annotation/json_annotation.dart';

import 'rating_by_id.dart';

part 'ratings_by_id.g.dart';

@JsonSerializable()
class RatingsById {
  final RatingById simkl;
  final RatingById imdb;

  RatingsById({required this.simkl, required this.imdb});

  factory RatingsById.fromJson(Map<String, dynamic> json) => _$RatingsByIdFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsByIdToJson(this);
}
