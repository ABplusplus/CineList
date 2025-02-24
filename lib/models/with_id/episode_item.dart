import 'package:json_annotation/json_annotation.dart';

part 'episode_item.g.dart';

@JsonSerializable()
class EpisodeItem {
  final int? season;
  final int? episode;
  final String? type;
  final bool? aired;
  final String? img;
  final DateTime? date;
  final EpisodeIds? ids;

  EpisodeItem({
    this.season,
    this.episode,
    this.type,
    this.aired,
    this.img,
    this.date,
    this.ids,
  });

  factory EpisodeItem.fromJson(Map<String, dynamic> json) =>
      _$EpisodeItemFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeItemToJson(this);
}

@JsonSerializable()
class EpisodeIds {
  @JsonKey(name: "simkl_id")
  final int? simklId;

  EpisodeIds({this.simklId});

  factory EpisodeIds.fromJson(Map<String, dynamic> json) =>
      _$EpisodeIdsFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeIdsToJson(this);
}
