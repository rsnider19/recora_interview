part of 'home_cubit.dart';

@immutable
@CopyWith()
class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.searchQuery = '',
    this.trendingMovies = const [],
    this.movieResults = const [],
  });

  final HomeStatus status;
  final String searchQuery;
  final List<Movie> trendingMovies;
  final List<Movie> movieResults;

  @override
  List<Object> get props => [
        status,
        searchQuery,
        trendingMovies,
        movieResults,
      ];
}
