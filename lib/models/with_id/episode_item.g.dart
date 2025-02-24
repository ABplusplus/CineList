// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeItem _$EpisodeItemFromJson(Map<String, dynamic> json) => EpisodeItem(
      season: (json['season'] as num?)?.toInt(),
      episode: (json['episode'] as num?)?.toInt(),
      type: json['type'] as String?,
      aired: json['aired'] as bool?,
      img: json['img'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      ids: json['ids'] == null
          ? null
          : EpisodeIds.fromJson(json['ids'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeItemToJson(EpisodeItem instance) =>
    <String, dynamic>{
      'season': instance.season,
      'episode': instance.episode,
      'type': instance.type,
      'aired': instance.aired,
      'img': instance.img,
      'date': instance.date?.toIso8601String(),
      'ids': instance.ids,
    };

EpisodeIds _$EpisodeIdsFromJson(Map<String, dynamic> json) => EpisodeIds(
      simklId: (json['simkl_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EpisodeIdsToJson(EpisodeIds instance) =>
    <String, dynamic>{
      'simkl_id': instance.simklId,
    };
