import 'package:json_annotation/json_annotation.dart';
import 'ids.dart';

part 'tv_item.g.dart';

@JsonSerializable()
class TvItem {
  final String title;
  final String poster;
  final Ids ids;

  TvItem({
    required this.title,
    required this.poster,
    required this.ids,
  });

  factory TvItem.fromJson(Map<String, dynamic> json) => _$TvItemFromJson(json);

  Map<String, dynamic> toJson() => _$TvItemToJson(this);
}
