import 'package:json_annotation/json_annotation.dart';
import 'today.dart';
import 'yesterday.dart';

part 'new_episodes.g.dart';

@JsonSerializable()
class NewEpisodes {
  final Today today;
  final Yesterday yesterday;

  NewEpisodes({
    required this.today,
    required this.yesterday,
  });

  factory NewEpisodes.fromJson(Map<String, dynamic> json) =>
      _$NewEpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$NewEpisodesToJson(this);
}
