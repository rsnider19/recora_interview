import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:recora/movie_details/widgets/widgets.dart';

import '../cubit/movie_details_cubit.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  static Route<MovieDetailsPage> route(Movie movie) {
    return MaterialPageRoute(
      builder: (context) => MovieDetailsPage(
        movie: movie,
      ),
      settings: const RouteSettings(
        name: '/movie_details',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsCubit(
        movieRepository: context.read<MovieRepository>(),
      )..load(movie),
      child: const MovieDetailsView(),
    );
  }
}

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movie = context.read<MovieDetailsCubit>().state.movieRequired;

    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                DetailsSummary(movie: movie),
                Builder(
                  builder: (context) {
                    final status = context.select(
                      (MovieDetailsCubit cubit) => cubit.state.status,
                    );

                    switch (status) {
                      case MovieDetailsStatus.initial:
                        return const SizedBox.shrink();
                      case MovieDetailsStatus.loading:
                        return const Center(child: CircularProgressIndicator());
                      case MovieDetailsStatus.success:
                        return const MovieDetailsContent();
                      case MovieDetailsStatus.failure:
                        return const Center(child: Text('Oops! Something went wrong.'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final recommendedMovies = context.select(
      (MovieDetailsCubit cubit) => cubit.state.recommendedMovies,
    );

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              'Recommendations',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 200),
          child: RecommendedMovies(
            movies: recommendedMovies,
          ),
        ),
      ],
    );
  }
}
