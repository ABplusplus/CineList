// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yesterday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Yesterday _$YesterdayFromJson(Map<String, dynamic> json) => Yesterday(
      dayTs: (json['day_ts'] as num).toInt(),
      timezone: json['timezone'] as String,
      items: Items.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$YesterdayToJson(Yesterday instance) => <String, dynamic>{
      'day_ts': instance.dayTs,
      'timezone': instance.timezone,
      'items': instance.items,
    };
