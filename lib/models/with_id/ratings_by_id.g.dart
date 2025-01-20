// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingsById _$RatingsByIdFromJson(Map<String, dynamic> json) => RatingsById(
      simkl: RatingById.fromJson(json['simkl'] as Map<String, dynamic>),
      imdb: RatingById.fromJson(json['imdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingsByIdToJson(RatingsById instance) =>
    <String, dynamic>{
      'simkl': instance.simkl,
      'imdb': instance.imdb,
    };
