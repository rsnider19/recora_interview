import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_repository/src/models/movie.dart';
import 'package:movie_repository/src/movie_api.dart';

class MovieException implements Exception {
  MovieException(this.message);

  final String? message;

  @override
  String toString() => 'MovieException: $message';
}

/// {@template rest_movie_api}
/// A REST API for accessing Movies
/// {@endtemplate}
class RestMovieApi extends MovieApi {
  /// {@macro rest_movie_api}
  RestMovieApi({
    required this.apiKey,
  });

  final String apiKey;

  static const String _baseUrl = 'api.themoviedb.org';

  Uri _getUri(
    String path, {
    Map<String, dynamic>? queryParams,
  }) {
    return Uri.https(
      _baseUrl,
      path,
      {
        'api_key': apiKey,
        ...?queryParams,
      },
    );
  }

  @override
  Future<List<Movie>> getTrendingMovies() async {
    final uri = _getUri('/3/trending/movie/week');
    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      return (data['results'] as List).map((m) => Movie.fromJson(m as Map<String, dynamic>)).toList();
    } else {
      throw MovieException(resp.body);
    }
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getRecommendations(int id) async {
    final uri = _getUri('/3/movie/$id/recommendations');
    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      return (data['results'] as List).map((m) => Movie.fromJson(m as Map<String, dynamic>)).toList();
    } else {
      throw MovieException(resp.body);
    }
  }
}
