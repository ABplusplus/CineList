// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animes _$AnimesFromJson(Map<String, dynamic> json) => Animes(
      animeList: (json['top_aired_fanarts'] as List<dynamic>)
          .map((e) => TopAiredFanart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimesToJson(Animes instance) => <String, dynamic>{
      'top_aired_fanarts': instance.animeList,
    };
