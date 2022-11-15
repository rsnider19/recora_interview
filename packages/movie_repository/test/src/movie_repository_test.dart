// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:mocktail/mocktail.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:movie_repository/src/movie_api.dart';

// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';

class MockMovieApi extends Mock implements MovieApi {}

void main() {
  group('MovieRepository', () {
    late final MovieApi movieApi;

    setUp(() {
      movieApi = MockMovieApi();
    });

    test('can be instantiated', () {
      expect(
        MovieRepository(
          movieApi: movieApi,
        ),
        isNotNull,
      );
    });
  });
}
