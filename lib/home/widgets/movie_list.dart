import 'package:flutter/material.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:recora/movie_details/view/movie_details_page.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;
  static const moviePosterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.55,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MovieDetailsPage.route(movie),
          ),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.network(
                  '$moviePosterBaseUrl${movie.posterPath}',
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        movie.title,
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
