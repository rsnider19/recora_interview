// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MovieDetailsStateCWProxy {
  MovieDetailsState movie(Movie? movie);

  MovieDetailsState recommendedMovies(List<Movie> recommendedMovies);

  MovieDetailsState status(MovieDetailsStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MovieDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MovieDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  MovieDetailsState call({
    Movie? movie,
    List<Movie>? recommendedMovies,
    MovieDetailsStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMovieDetailsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMovieDetailsState.copyWith.fieldName(...)`
class _$MovieDetailsStateCWProxyImpl implements _$MovieDetailsStateCWProxy {
  final MovieDetailsState _value;

  const _$MovieDetailsStateCWProxyImpl(this._value);

  @override
  MovieDetailsState movie(Movie? movie) => this(movie: movie);

  @override
  MovieDetailsState recommendedMovies(List<Movie> recommendedMovies) =>
      this(recommendedMovies: recommendedMovies);

  @override
  MovieDetailsState status(MovieDetailsStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MovieDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MovieDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  MovieDetailsState call({
    Object? movie = const $CopyWithPlaceholder(),
    Object? recommendedMovies = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return MovieDetailsState(
      movie: movie == const $CopyWithPlaceholder()
          ? _value.movie
          // ignore: cast_nullable_to_non_nullable
          : movie as Movie?,
      recommendedMovies: recommendedMovies == const $CopyWithPlaceholder() ||
              recommendedMovies == null
          ? _value.recommendedMovies
          // ignore: cast_nullable_to_non_nullable
          : recommendedMovies as List<Movie>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as MovieDetailsStatus,
    );
  }
}

extension $MovieDetailsStateCopyWith on MovieDetailsState {
  /// Returns a callable class that can be used as follows: `instanceOfMovieDetailsState.copyWith(...)` or like so:`instanceOfMovieDetailsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MovieDetailsStateCWProxy get copyWith =>
      _$MovieDetailsStateCWProxyImpl(this);
}
