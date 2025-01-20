import 'package:json_annotation/json_annotation.dart';
import 'ids_by_id.dart';

part 'user_recommendation.g.dart';

@JsonSerializable()
class UserRecommendation {
  final String title;
  final int year;
  final String poster;
  final String? usersPercent;
  final int usersCount;
  final IdsById ids;

  UserRecommendation({
    required this.title,
    required this.year,
    required this.poster,
    this.usersPercent,
    required this.usersCount,
    required this.ids,
  });

  factory UserRecommendation.fromJson(Map<String, dynamic> json) => _$UserRecommendationFromJson(json);

  Map<String, dynamic> toJson() => _$UserRecommendationToJson(this);
}
