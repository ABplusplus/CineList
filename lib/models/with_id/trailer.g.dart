// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      name: json['name'] as String?,
      youtube: json['youtube'] as String?,
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'name': instance.name,
      'youtube': instance.youtube,
      'size': instance.size,
    };
