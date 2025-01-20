import 'package:json_annotation/json_annotation.dart';

part 'rating_by_id.g.dart';

@JsonSerializable()
class RatingById {
  final double rating;
  final int votes;

  RatingById({required this.rating, required this.votes});

  factory RatingById.fromJson(Map<String, dynamic> json) => _$RatingByIdFromJson(json);

  Map<String, dynamic> toJson() => _$RatingByIdToJson(this);
}
