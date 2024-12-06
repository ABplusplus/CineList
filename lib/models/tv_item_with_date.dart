import 'package:json_annotation/json_annotation.dart';
import 'ids.dart';

part 'tv_item_with_date.g.dart';

@JsonSerializable()
class TvItemWithDate {
  final String title;
  final String poster;
  @JsonKey(name: "bottom_text")
  final String bottomText;
  final Ids ids;

  TvItemWithDate({
    required this.title,
    required this.poster,
    required this.bottomText,
    required this.ids,
  });

  factory TvItemWithDate.fromJson(Map<String, dynamic> json) =>
      _$TvItemWithDateFromJson(json);

  Map<String, dynamic> toJson() => _$TvItemWithDateToJson(this);
}
