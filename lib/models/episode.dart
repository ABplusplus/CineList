import 'package:json_annotation/json_annotation.dart';
import 'ids.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  final String? title;
  final int? rank;
  @JsonKey(name: "air_time")
  final String? airTime;
  final String? network;
  final String? poster;
  final int? season;
  final int? episode;
  final int? watched;
  final Ids? ids;

  Episode({
    this.title,
    this.rank,
    this.airTime,
    this.network,
    this.poster,
    this.season,
    this.episode,
    this.watched,
    this.ids,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
