import 'package:json_annotation/json_annotation.dart';
import 'episode.dart';

part 'items.g.dart';

List<Episode> _episodeListFromJson(dynamic json) {
  if (json == null) return <Episode>[];
  return (json as List)
      .map((e) => Episode.fromJson(e as Map<String, dynamic>))
      .toList();
}

@JsonSerializable()
class Items {
  @JsonKey(defaultValue: const [], fromJson: _episodeListFromJson)
  final List<Episode>? all;
  @JsonKey(name: "new", defaultValue: const [], fromJson: _episodeListFromJson)
  final List<Episode>? newEpisodes;

  const Items({
    this.all,
    this.newEpisodes,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
