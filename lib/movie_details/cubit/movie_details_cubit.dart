import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_repository/movie_repository.dart';

part 'movie_details_cubit.g.dart';
part 'movie_details_state.dart';

enum MovieDetailsStatus { initial, loading, success, failure }

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(const MovieDetailsState());

  MovieRepository _movieRepository;

  Future<void> load(Movie movie) async {
    emit(
      MovieDetailsState(
        status: MovieDetailsStatus.loading,
        movie: movie,
      ),
    );

    final recommendedMovies = await _movieRepository.getRecommendations(movie.id);

    emit(
      state.copyWith(
        status: MovieDetailsStatus.success,
        recommendedMovies: recommendedMovies,
      ),
    );
  }
}
