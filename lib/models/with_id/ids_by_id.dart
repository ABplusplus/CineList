import 'package:json_annotation/json_annotation.dart';

part 'ids_by_id.g.dart';

@JsonSerializable()
class IdsById {
  final int? simkl;
  final String? slug;
  final String? tvdb;
  final String? offen;
  final String? fb;
  final String? tw;
  final String? imdb;
  final String? tvdbslug;
  final String? tmdb;
  final String? traktslug;

  IdsById({
    this.simkl,
    this.slug,
    this.tvdb,
    this.offen,
    this.fb,
    this.tw,
    this.imdb,
    this.tvdbslug,
    this.tmdb,
    this.traktslug,
  });

  factory IdsById.fromJson(Map<String, dynamic> json) =>
      _$IdsByIdFromJson(json);

  Map<String, dynamic> toJson() => _$IdsByIdToJson(this);
}
