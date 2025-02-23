// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_episodes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewEpisodes _$NewEpisodesFromJson(Map<String, dynamic> json) => NewEpisodes(
      today: json['today'] == null
          ? null
          : Today.fromJson(json['today'] as Map<String, dynamic>),
      yesterday: json['yesterday'] == null
          ? null
          : Yesterday.fromJson(json['yesterday'] as Map<String, dynamic>),
      twoDays: json['2days'] == null
          ? null
          : Today.fromJson(json['2days'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewEpisodesToJson(NewEpisodes instance) =>
    <String, dynamic>{
      'today': instance.today,
      'yesterday': instance.yesterday,
      '2days': instance.twoDays,
    };
