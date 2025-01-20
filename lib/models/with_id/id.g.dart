// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      simkl: (json['simkl'] as num).toInt(),
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'simkl': instance.simkl,
      'slug': instance.slug,
    };
