// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeItem _$EpisodeItemFromJson(Map<String, dynamic> json) => EpisodeItem(
      title: json['title'] as String,
      episode: (json['episode'] as num).toInt(),
      airDate: json['airDate'] as String,
      poster: json['poster'] as String,
    );

Map<String, dynamic> _$EpisodeItemToJson(EpisodeItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'episode': instance.episode,
      'airDate': instance.airDate,
      'poster': instance.poster,
    };
