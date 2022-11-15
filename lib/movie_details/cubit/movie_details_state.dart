part of 'movie_details_cubit.dart';

@immutable
@CopyWith()
class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.status = MovieDetailsStatus.initial,
    this.movie,
    this.recommendedMovies = const [],
  });

  final MovieDetailsStatus status;
  final Movie? movie;
  final List<Movie> recommendedMovies;

  Movie get movieRequired => movie!;

  @override
  List<Object?> get props => [
        status,
        movie,
        recommendedMovies,
      ];
}
