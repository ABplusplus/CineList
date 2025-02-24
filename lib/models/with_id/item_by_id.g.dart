// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemById _$ItemByIdFromJson(Map<String, dynamic> json) => ItemById(
      title: json['title'] as String?,
      year: (json['year'] as num?)?.toInt(),
      type: json['type'] as String?,
      ids: json['ids'] == null
          ? null
          : IdsById.fromJson(json['ids'] as Map<String, dynamic>),
      yearStartEnd: json['yearStartEnd'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
      poster: json['poster'] as String?,
      fanart: json['fanart'] as String?,
      firstAired: json['firstAired'] as String?,
      lastAired: ItemById._nullableString(json['lastAired']),
      airs: json['airs'] == null
          ? null
          : Airs.fromJson(json['airs'] as Map<String, dynamic>),
      runtime: (json['runtime'] as num?)?.toInt(),
      certification: ItemById._nullableString(json['certification']),
      overview: json['overview'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      country: json['country'] as String?,
      totalEpisodes: (json['totalEpisodes'] as num?)?.toInt(),
      status: json['status'] as String?,
      network: json['network'] as String?,
      ratings: json['ratings'] == null
          ? null
          : RatingsById.fromJson(json['ratings'] as Map<String, dynamic>),
      trailers: (json['trailers'] as List<dynamic>?)
          ?.map((e) => Trailer.fromJson(e as Map<String, dynamic>))
          .toList(),
      usersRecommendations: (json['users_recommendations'] as List<dynamic>?)
          ?.map((e) => UserRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemByIdToJson(ItemById instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'type': instance.type,
      'ids': instance.ids,
      'yearStartEnd': instance.yearStartEnd,
      'rank': instance.rank,
      'poster': instance.poster,
      'fanart': instance.fanart,
      'firstAired': instance.firstAired,
      'lastAired': instance.lastAired,
      'airs': instance.airs,
      'runtime': instance.runtime,
      'certification': instance.certification,
      'overview': instance.overview,
      'genres': instance.genres,
      'country': instance.country,
      'totalEpisodes': instance.totalEpisodes,
      'status': instance.status,
      'network': instance.network,
      'ratings': instance.ratings,
      'trailers': instance.trailers,
      'users_recommendations': instance.usersRecommendations,
    };
