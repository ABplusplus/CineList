// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      title: json['title'] as String,
      rank: (json['rank'] as num?)?.toInt(),
      airTime: json['airTime'] as String?,
      network: json['network'] as String,
      poster: json['poster'] as String,
      season: (json['season'] as num).toInt(),
      episode: (json['episode'] as num).toInt(),
      watched: (json['watched'] as num).toInt(),
      ids: Ids.fromJson(json['ids'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'title': instance.title,
      'rank': instance.rank,
      'airTime': instance.airTime,
      'network': instance.network,
      'poster': instance.poster,
      'season': instance.season,
      'episode': instance.episode,
      'watched': instance.watched,
      'ids': instance.ids,
    };
