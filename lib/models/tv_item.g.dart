// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvItem _$TvItemFromJson(Map<String, dynamic> json) => TvItem(
      title: json['title'] as String,
      poster: json['poster'] as String,
      ids: Ids.fromJson(json['ids'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TvItemToJson(TvItem instance) => <String, dynamic>{
      'title': instance.title,
      'poster': instance.poster,
      'ids': instance.ids,
    };
