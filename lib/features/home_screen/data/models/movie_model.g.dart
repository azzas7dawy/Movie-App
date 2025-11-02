// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  page: (json['page'] as num).toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => Result.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalResults: (json['totalResults'] as num).toInt(),
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results,
  'totalPages': instance.totalPages,
  'totalResults': instance.totalResults,
};

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  description: json['description'] as String,
  favoriteCount: (json['favoriteCount'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  itemCount: (json['itemCount'] as num).toInt(),
  iso6391: $enumDecode(_$Iso6391EnumMap, json['iso6391']),
  listType: $enumDecode(_$ListTypeEnumMap, json['listType']),
  name: json['name'] as String,
  posterPath: json['posterPath'] as String?,
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'description': instance.description,
  'favoriteCount': instance.favoriteCount,
  'id': instance.id,
  'itemCount': instance.itemCount,
  'iso6391': _$Iso6391EnumMap[instance.iso6391]!,
  'listType': _$ListTypeEnumMap[instance.listType]!,
  'name': instance.name,
  'posterPath': instance.posterPath,
};

const _$Iso6391EnumMap = {Iso6391.EN: 'EN'};

const _$ListTypeEnumMap = {ListType.MOVIE: 'MOVIE'};
