import 'package:flutter/material.dart';
import 'package:movie_repository/src/models/movie.dart';
import 'package:recora_utils/recora_utils.dart';

class DetailsSummary extends StatelessWidget {
  const DetailsSummary({
    super.key,
    required this.movie,
  });

  final Movie movie;

  static const movieBackdropBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network('$movieBackdropBaseUrl${movie.backdropPath}'),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${movie.title} ',
                        style: textTheme.headlineSmall,
                      ),
                      TextSpan(
                        text: '(${movie.releaseDate.substring(0, 4)})',
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircularProgressIndicator(
                        value: movie.voteAverage / 10,
                        backgroundColor: Colors.grey.shade400,
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            '${(movie.voteAverage * 10).floor()}',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  Text('${movie.voteCount.abbreviated} votes')
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Overview',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                movie.overview,
                style: textTheme.bodyMedium?.copyWith(height: 1.4),
              )
            ],
          ),
        ),
      ],
    );
  }
}
