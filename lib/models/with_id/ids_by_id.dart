import 'package:json_annotation/json_annotation.dart';

part 'ids_by_id.g.dart';

@JsonSerializable()
class IdsById {
  final int simkl;
  final String slug;

  IdsById({required this.simkl, required this.slug});

  factory IdsById.fromJson(Map<String, dynamic> json) => _$IdsByIdFromJson(json);

  Map<String, dynamic> toJson() => _$IdsByIdToJson(this);
}
