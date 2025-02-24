// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRecommendation _$UserRecommendationFromJson(Map<String, dynamic> json) =>
    UserRecommendation(
      title: json['title'] as String?,
      year: (json['year'] as num?)?.toInt(),
      poster: json['poster'] as String?,
      usersPercent: UserRecommendation._nullableString(json['usersPercent']),
      usersCount: (json['usersCount'] as num?)?.toInt(),
      ids: json['ids'] == null
          ? null
          : IdsById.fromJson(json['ids'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRecommendationToJson(UserRecommendation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'poster': instance.poster,
      'usersPercent': instance.usersPercent,
      'usersCount': instance.usersCount,
      'ids': instance.ids,
    };
