// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:movie_repository/src/models/models.dart';
import 'package:movie_repository/src/movie_api.dart';

/// {@template movie_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class MovieRepository {
  /// {@macro movie_repository}
  const MovieRepository({
    required MovieApi movieApi,
  }) : _movieApi = movieApi;

  final MovieApi _movieApi;

  Future<List<Movie>> getTrendingMovies() {
    return _movieApi.getTrendingMovies();
  }

  Future<List<Movie>> searchMovies(String query) {
    return _movieApi.searchMovies(query);
  }

  Future<List<Movie>> getRecommendations(int id) {
    return _movieApi.getRecommendations(id);
  }
}
