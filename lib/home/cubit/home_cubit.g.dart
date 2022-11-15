// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState movieResults(List<Movie> movieResults);

  HomeState searchQuery(String searchQuery);

  HomeState status(HomeStatus status);

  HomeState trendingMovies(List<Movie> trendingMovies);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    List<Movie>? movieResults,
    String? searchQuery,
    HomeStatus? status,
    List<Movie>? trendingMovies,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeState.copyWith.fieldName(...)`
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  final HomeState _value;

  const _$HomeStateCWProxyImpl(this._value);

  @override
  HomeState movieResults(List<Movie> movieResults) =>
      this(movieResults: movieResults);

  @override
  HomeState searchQuery(String searchQuery) => this(searchQuery: searchQuery);

  @override
  HomeState status(HomeStatus status) => this(status: status);

  @override
  HomeState trendingMovies(List<Movie> trendingMovies) =>
      this(trendingMovies: trendingMovies);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    Object? movieResults = const $CopyWithPlaceholder(),
    Object? searchQuery = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? trendingMovies = const $CopyWithPlaceholder(),
  }) {
    return HomeState(
      movieResults:
          movieResults == const $CopyWithPlaceholder() || movieResults == null
              ? _value.movieResults
              // ignore: cast_nullable_to_non_nullable
              : movieResults as List<Movie>,
      searchQuery:
          searchQuery == const $CopyWithPlaceholder() || searchQuery == null
              ? _value.searchQuery
              // ignore: cast_nullable_to_non_nullable
              : searchQuery as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as HomeStatus,
      trendingMovies: trendingMovies == const $CopyWithPlaceholder() ||
              trendingMovies == null
          ? _value.trendingMovies
          // ignore: cast_nullable_to_non_nullable
          : trendingMovies as List<Movie>,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeState.copyWith(...)` or like so:`instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}
