import 'package:json_annotation/json_annotation.dart';

part 'episode_item.g.dart';

@JsonSerializable()
class EpisodeItem {
  final String title;
  final int episode;
  final String airDate;
  final String poster;

  EpisodeItem({required this.title, required this.episode, required this.airDate, required this.poster});

  factory EpisodeItem.fromJson(Map<String, dynamic> json) => _$EpisodeItemFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeItemToJson(this);
}
