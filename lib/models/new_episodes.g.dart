// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_episodes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewEpisodes _$NewEpisodesFromJson(Map<String, dynamic> json) => NewEpisodes(
      today: Today.fromJson(json['today'] as Map<String, dynamic>),
      yesterday: Yesterday.fromJson(json['yesterday'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewEpisodesToJson(NewEpisodes instance) =>
    <String, dynamic>{
      'today': instance.today,
      'yesterday': instance.yesterday,
    };
