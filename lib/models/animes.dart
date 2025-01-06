import 'package:cinelist/models/top_aired_fanart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'tvs.dart';

part 'animes.g.dart';

@JsonSerializable()
class Animes {
  @JsonKey(name: "top_aired_fanarts")
  final List<TopAiredFanart> animeList;

  Animes({required this.animeList});

  factory Animes.fromJson(Map<String, dynamic> json) => _$AnimesFromJson(json);

  Map<String, dynamic> toJson() => _$AnimesToJson(this);
}
