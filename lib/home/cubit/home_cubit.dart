import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_repository/movie_repository.dart';

part 'home_cubit.g.dart';

part 'home_state.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(const HomeState());

  final MovieRepository _movieRepository;

  Future<void> load() async {
    emit(const HomeState(status: HomeStatus.loading));

    final trendingMovies = await _movieRepository.getTrendingMovies();

    emit(
      state.copyWith(
        status: HomeStatus.success,
        trendingMovies: trendingMovies,
      ),
    );
  }
}
