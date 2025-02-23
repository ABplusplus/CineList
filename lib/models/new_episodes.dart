import 'package:json_annotation/json_annotation.dart';
import 'today.dart';
import 'yesterday.dart';

part 'new_episodes.g.dart';

@JsonSerializable()
class NewEpisodes {
  final Today? today;
  final Yesterday? yesterday;
  @JsonKey(name: "2days")
  final Today? twoDays;

  NewEpisodes({
    this.today,
    this.yesterday,
    this.twoDays,
  });

  factory NewEpisodes.fromJson(Map<String, dynamic> json) =>
      _$NewEpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$NewEpisodesToJson(this);
}
