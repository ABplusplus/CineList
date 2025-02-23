// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      all: json['all'] == null ? [] : _episodeListFromJson(json['all']),
      newEpisodes: json['new'] == null ? [] : _episodeListFromJson(json['new']),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'all': instance.all,
      'new': instance.newEpisodes,
    };
