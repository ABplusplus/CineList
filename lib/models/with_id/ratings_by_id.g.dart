// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingDetail _$RatingDetailFromJson(Map<String, dynamic> json) => RatingDetail(
      rating: (json['rating'] as num?)?.toDouble(),
      votes: (json['votes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingDetailToJson(RatingDetail instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'votes': instance.votes,
    };

RatingsById _$RatingsByIdFromJson(Map<String, dynamic> json) => RatingsById(
      simkl: json['simkl'] == null
          ? null
          : RatingDetail.fromJson(json['simkl'] as Map<String, dynamic>),
      imdb: json['imdb'] == null
          ? null
          : RatingDetail.fromJson(json['imdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingsByIdToJson(RatingsById instance) =>
    <String, dynamic>{
      'simkl': instance.simkl,
      'imdb': instance.imdb,
    };
