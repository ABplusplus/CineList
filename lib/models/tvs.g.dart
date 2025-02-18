// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVs _$TVsFromJson(Map<String, dynamic> json) => TVs(
      topAiredFanarts: (json['top_aired_fanarts'] as List<dynamic>)
          .map((e) => TopAiredFanart.fromJson(e as Map<String, dynamic>))
          .toList(),
      mostWatchedThisMonth: (json['most_watched_this_month'] as List<dynamic>)
          .map((e) => TvItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      topLastAired: (json['top_last_aired'] as List<dynamic>)
          .map((e) => TvItemWithDate.fromJson(e as Map<String, dynamic>))
          .toList(),
      premieres: (json['premieres'] as List<dynamic>)
          .map((e) => TvItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TVsToJson(TVs instance) => <String, dynamic>{
      'top_aired_fanarts':
          instance.topAiredFanarts.map((e) => e.toJson()).toList(),
      'most_watched_this_month':
          instance.mostWatchedThisMonth.map((e) => e.toJson()).toList(),
      'top_last_aired': instance.topLastAired.map((e) => e.toJson()).toList(),
      'premieres': instance.premieres.map((e) => e.toJson()).toList(),
    };
