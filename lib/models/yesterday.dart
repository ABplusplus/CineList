import 'package:json_annotation/json_annotation.dart';
import 'items.dart';

part 'yesterday.g.dart';

@JsonSerializable()
class Yesterday {
  @JsonKey(name: "day_ts")
  final int dayTs;
  final String timezone;
  @JsonKey(fromJson: _itemsFromJson)
  final Items items;

  Yesterday({
    required this.dayTs,
    required this.timezone,
    required this.items,
  });

  static Items _itemsFromJson(dynamic json) {
    if (json == null) return const Items(all: [], newEpisodes: []);
    return Items.fromJson(json as Map<String, dynamic>);
  }

  factory Yesterday.fromJson(Map<String, dynamic> json) =>
      _$YesterdayFromJson(json);
  Map<String, dynamic> toJson() => _$YesterdayToJson(this);
}
