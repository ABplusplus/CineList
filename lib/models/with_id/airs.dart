import 'package:json_annotation/json_annotation.dart';

part 'airs.g.dart';

@JsonSerializable()
class Airs {
  final String day;
  final String time;
  final String timezone;

  Airs({required this.day, required this.time, required this.timezone});

  factory Airs.fromJson(Map<String, dynamic> json) => _$AirsFromJson(json);

  Map<String, dynamic> toJson() => _$AirsToJson(this);
}
