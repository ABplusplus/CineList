import 'package:json_annotation/json_annotation.dart';
import 'items.dart';

part 'today.g.dart';

@JsonSerializable()
class Today {
  @JsonKey(name: "day_ts")
  final int dayTs;
  final String timezone;
  @JsonKey(fromJson: _itemsFromJson)
  final Items? items;

  Today({
    required this.dayTs,
    required this.timezone,
    this.items,
  });

  static Items _itemsFromJson(dynamic json) {
    if (json == null) return const Items(all: [], newEpisodes: []);
    return Items.fromJson(json as Map<String, dynamic>);
  }

  factory Today.fromJson(Map<String, dynamic> json) =>
      _$TodayFromJson(json);
  Map<String, dynamic> toJson() => _$TodayToJson(this);
}
