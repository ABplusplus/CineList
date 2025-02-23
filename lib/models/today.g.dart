// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Today _$TodayFromJson(Map<String, dynamic> json) => Today(
      dayTs: (json['day_ts'] as num).toInt(),
      timezone: json['timezone'] as String,
      items: Today._itemsFromJson(json['items']),
    );

Map<String, dynamic> _$TodayToJson(Today instance) => <String, dynamic>{
      'day_ts': instance.dayTs,
      'timezone': instance.timezone,
      'items': instance.items,
    };
