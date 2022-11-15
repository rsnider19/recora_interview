import 'package:flutter/material.dart';
import 'package:movie_repository/src/models/movie.dart';
import 'package:recora/movie_details/view/movie_details_page.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;
  static const moviePosterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MovieDetailsPage.route(movie),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: MediaQuery.of(context).size.width * 0.75,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      '$moviePosterBaseUrl${movie.backdropPath}',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('${(movie.voteAverage * 10).floor()}%')
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
