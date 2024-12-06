// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animes _$AnimesFromJson(Map<String, dynamic> json) => Animes(
      animeList: (json['animes'] as List<dynamic>)
          .map((e) => TVs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimesToJson(Animes instance) => <String, dynamic>{
      'animes': instance.animeList,
    };
