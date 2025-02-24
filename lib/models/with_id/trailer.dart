import 'package:json_annotation/json_annotation.dart';

part 'trailer.g.dart';

@JsonSerializable()
class Trailer {
  final String? name;
  final String? youtube;
  final int? size;

  Trailer({this.name, this.youtube, this.size});

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}
