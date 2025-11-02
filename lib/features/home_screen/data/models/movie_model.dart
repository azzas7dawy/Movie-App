import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    Movie({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
    Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Result {
    String description;
    int favoriteCount;
    int id;
    int itemCount;
    Iso6391 iso6391;
    ListType listType;
    String name;
    String? posterPath;

    Result({
        required this.description,
        required this.favoriteCount,
        required this.id,
        required this.itemCount,
        required this.iso6391,
        required this.listType,
        required this.name,
        required this.posterPath,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
    Map<String, dynamic> toJson() => _$ResultToJson(this);
}

enum Iso6391 {
    EN
}

enum ListType {
    MOVIE
}
