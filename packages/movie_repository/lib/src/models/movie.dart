import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'movie.g.dart';

@immutable
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Movie extends Equatable {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });

  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final double popularity;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        popularity,
      ];
}
