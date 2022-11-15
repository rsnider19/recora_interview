import 'package:movie_repository/src/models/models.dart';

/// {@template movie}
/// An abstract API for accessing Movies
/// {@endtemplate}
abstract class MovieApi {
  /// {@macro movie}
  const MovieApi();

  Future<List<Movie>> getTrendingMovies();

  Future<List<Movie>> searchMovies(String query);

  Future<Movie> getMovie(int id);
}
