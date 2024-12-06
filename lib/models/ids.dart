import 'package:json_annotation/json_annotation.dart';

part 'ids.g.dart';

@JsonSerializable()
class Ids {
  final int simkl;
  final String slug;

  Ids({
    required this.simkl,
    required this.slug,
  });

  factory Ids.fromJson(Map<String, dynamic> json) => _$IdsFromJson(json);

  Map<String, dynamic> toJson() => _$IdsToJson(this);
}
