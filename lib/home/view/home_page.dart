import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:recora/home/widgets/widgets.dart';

import '../cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static Route<HomePage> route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
      settings: const RouteSettings(
        name: '/home',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        movieRepository: context.read<MovieRepository>(),
      )..load(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          final status = context.select((HomeCubit cubit) => cubit.state.status);

          switch (status) {
            case HomeStatus.initial:
              return const SizedBox.shrink();
            case HomeStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case HomeStatus.success:
              return const HomeContent();
            case HomeStatus.failure:
              return const Center(child: Text('Oops! Something went wrong.'));
          }
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final trendingMovies = context.select(
      (HomeCubit cubit) => cubit.state.trendingMovies,
    );

    return Column(
      children: [
        const SearchBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: MovieList(
              movies: trendingMovies,
            ),
          ),
        ),
      ],
    );
  }
}
