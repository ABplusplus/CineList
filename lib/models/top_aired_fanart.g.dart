// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_aired_fanart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopAiredFanart _$TopAiredFanartFromJson(Map<String, dynamic> json) =>
    TopAiredFanart(
      title: json['title'] as String,
      rank: (json['rank'] as num).toInt(),
      art: json['art'] as String,
      episodeTitle: json['episode_title'] as String,
      episode: json['episode'] as String,
    );

Map<String, dynamic> _$TopAiredFanartToJson(TopAiredFanart instance) =>
    <String, dynamic>{
      'title': instance.title,
      'rank': instance.rank,
      'art': instance.art,
      'episode_title': instance.episodeTitle,
      'episode': instance.episode,
    };
