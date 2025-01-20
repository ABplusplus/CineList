// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingById _$RatingByIdFromJson(Map<String, dynamic> json) => RatingById(
      rating: (json['rating'] as num).toDouble(),
      votes: (json['votes'] as num).toInt(),
    );

Map<String, dynamic> _$RatingByIdToJson(RatingById instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'votes': instance.votes,
    };
