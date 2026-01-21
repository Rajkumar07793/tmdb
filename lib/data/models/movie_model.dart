import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
