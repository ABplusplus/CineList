import 'package:json_annotation/json_annotation.dart';
import 'top_aired_fanart.dart';
import 'new_episodes.dart';
import 'tv_item.dart';
import 'tv_item_with_date.dart';

part 'tvs.g.dart';

@JsonSerializable()
class TVs {
  @JsonKey(name: "top_aired_fanarts")
  final List<TopAiredFanart> topAiredFanarts;
  @JsonKey(name: "new_episodes")
  final NewEpisodes newEpisodes;
  @JsonKey(name: "most_watched_this_month")
  final List<TvItem> mostWatchedThisMonth;
  @JsonKey(name: "top_last_aired")
  final List<TvItemWithDate> topLastAired;
  final List<TvItem> premieres;

  TVs({
    required this.topAiredFanarts,
    required this.newEpisodes,
    required this.mostWatchedThisMonth,
    required this.topLastAired,
    required this.premieres,
  });

  factory TVs.fromJson(Map<String, dynamic> json) => _$TVsFromJson(json);

  Map<String, dynamic> toJson() => _$TVsToJson(this);
}
