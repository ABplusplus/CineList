import 'package:json_annotation/json_annotation.dart';
import 'imdb.dart';

part 'ratings.g.dart';

@JsonSerializable()
class Ratings {
  final Imdb imdb;

  Ratings({required this.imdb});

  factory Ratings.fromJson(Map<String, dynamic> json) => _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}
