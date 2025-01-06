import 'package:json_annotation/json_annotation.dart';
import 'episode.dart';

part 'items.g.dart';

@JsonSerializable()
class Items {
  final List<Episode> all;
  @JsonKey(name: "new")
  final List<Episode> newEpisodes;

  Items({
    required this.all,
    required this.newEpisodes,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
