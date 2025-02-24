import 'package:json_annotation/json_annotation.dart';

part 'ratings_by_id.g.dart';

@JsonSerializable()
class RatingDetail {
  final double? rating;
  final int? votes;

  RatingDetail({this.rating, this.votes});

  factory RatingDetail.fromJson(Map<String, dynamic> json) =>
      _$RatingDetailFromJson(json);

  Map<String, dynamic> toJson() => _$RatingDetailToJson(this);
}

@JsonSerializable()
class RatingsById {
  final RatingDetail? simkl;
  final RatingDetail? imdb;

  RatingsById({this.simkl, this.imdb});

  factory RatingsById.fromJson(Map<String, dynamic> json) =>
      _$RatingsByIdFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsByIdToJson(this);
}
