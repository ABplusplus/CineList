// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_item_with_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvItemWithDate _$TvItemWithDateFromJson(Map<String, dynamic> json) =>
    TvItemWithDate(
      title: json['title'] as String,
      poster: json['poster'] as String,
      bottomText: json['bottom_text'] as String,
      ids: Ids.fromJson(json['ids'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TvItemWithDateToJson(TvItemWithDate instance) =>
    <String, dynamic>{
      'title': instance.title,
      'poster': instance.poster,
      'bottom_text': instance.bottomText,
      'ids': instance.ids,
    };
