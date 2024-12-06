import 'package:json_annotation/json_annotation.dart';
import 'ids.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  final String title;
  final int? rank;
  final String? airTime;
  final String network;
  final String poster;
  final int season;
  final int episode;
  final int watched;
  final Ids ids;

  Episode({
    required this.title,
    this.rank,
    this.airTime,
    required this.network,
    required this.poster,
    required this.season,
    required this.episode,
    required this.watched,
    required this.ids,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
