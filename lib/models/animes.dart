import 'package:json_annotation/json_annotation.dart';
import 'tvs.dart';

part 'animes.g.dart';

@JsonSerializable()
class Animes {
  @JsonKey(name: "animes")
  final List<TVs> animeList;

  Animes({required this.animeList});

  factory Animes.fromJson(Map<String, dynamic> json) => _$AnimesFromJson(json);

  Map<String, dynamic> toJson() => _$AnimesToJson(this);
}
