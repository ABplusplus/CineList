// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imdb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Imdb _$ImdbFromJson(Map<String, dynamic> json) => Imdb(
      rating: (json['rating'] as num).toDouble(),
      votes: (json['votes'] as num).toInt(),
    );

Map<String, dynamic> _$ImdbToJson(Imdb instance) => <String, dynamic>{
      'rating': instance.rating,
      'votes': instance.votes,
    };
