import 'package:json_annotation/json_annotation.dart';

part 'imdb.g.dart';

@JsonSerializable()
class Imdb {
  final double rating;
  final int votes;

  Imdb({
    required this.rating,
    required this.votes,
  });

  factory Imdb.fromJson(Map<String, dynamic> json) => _$ImdbFromJson(json);

  Map<String, dynamic> toJson() => _$ImdbToJson(this);
}
