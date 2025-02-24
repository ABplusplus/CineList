// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ids_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdsById _$IdsByIdFromJson(Map<String, dynamic> json) => IdsById(
      simkl: (json['simkl'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      tvdb: json['tvdb'] as String?,
      offen: json['offen'] as String?,
      fb: json['fb'] as String?,
      tw: json['tw'] as String?,
      imdb: json['imdb'] as String?,
      tvdbslug: json['tvdbslug'] as String?,
      tmdb: json['tmdb'] as String?,
      traktslug: json['traktslug'] as String?,
    );

Map<String, dynamic> _$IdsByIdToJson(IdsById instance) => <String, dynamic>{
      'simkl': instance.simkl,
      'slug': instance.slug,
      'tvdb': instance.tvdb,
      'offen': instance.offen,
      'fb': instance.fb,
      'tw': instance.tw,
      'imdb': instance.imdb,
      'tvdbslug': instance.tvdbslug,
      'tmdb': instance.tmdb,
      'traktslug': instance.traktslug,
    };
