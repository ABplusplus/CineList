import 'package:json_annotation/json_annotation.dart';
import 'items.dart';

part 'today.g.dart';

@JsonSerializable()
class Today {
  @JsonKey(name: "day_ts")
  final int dayTs;
  final String timezone;
  final Items items;

  Today({
    required this.dayTs,
    required this.timezone,
    required this.items,
  });

  factory Today.fromJson(Map<String, dynamic> json) => _$TodayFromJson(json);

  Map<String, dynamic> toJson() => _$TodayToJson(this);
}
