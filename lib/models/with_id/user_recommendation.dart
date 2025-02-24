import 'package:json_annotation/json_annotation.dart';
import 'ids_by_id.dart';

part 'user_recommendation.g.dart';

@JsonSerializable()
class UserRecommendation {
  final String? title;
  final int? year;
  final String? poster;
  @JsonKey(fromJson: _nullableString)
  final String? usersPercent;
  final int? usersCount;
  final IdsById? ids;

  UserRecommendation({
    this.title,
    this.year,
    this.poster,
    this.usersPercent,
    this.usersCount,
    this.ids,
  });

  factory UserRecommendation.fromJson(Map<String, dynamic> json) =>
      _$UserRecommendationFromJson(json);

  Map<String, dynamic> toJson() => _$UserRecommendationToJson(this);

  static String? _nullableString(dynamic value) =>
      value == null ? null : value as String;
}
