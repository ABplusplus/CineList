import 'package:json_annotation/json_annotation.dart';
import 'ratings.dart';

part 'top_aired_fanart.g.dart';

@JsonSerializable()
class TopAiredFanart {
  final String title;
  final int rank;
  final String art;
  final Ratings ratings;
  @JsonKey(name: "episode_title")
  final String episodeTitle;
  final String season;
  final String episode;

  TopAiredFanart({
    required this.title,
    required this.rank,
    required this.art,
    required this.ratings,
    required this.episodeTitle,
    required this.season,
    required this.episode,
  });

  factory TopAiredFanart.fromJson(Map<String, dynamic> json) =>
      _$TopAiredFanartFromJson(json);

  Map<String, dynamic> toJson() => _$TopAiredFanartToJson(this);
}
